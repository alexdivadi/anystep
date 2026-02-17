import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/max_width_container.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/presentation/event_feed/event_feed_screen.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/profile/domain/user_agreement_type.dart';
import 'package:anystep/core/features/profile/presentation/agreement/locale_icon_button.dart';
import 'package:anystep/core/features/profile/presentation/agreement/sign_agreement_screen_controller.dart';
import 'package:anystep/core/features/profile/presentation/agreement/text/agreements_en.dart' as en;
import 'package:anystep/core/features/profile/presentation/agreement/text/agreements_es.dart' as es;
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignAgreementScreen extends ConsumerStatefulWidget {
  const SignAgreementScreen({super.key});

  static const String path = '/sign-agreement';
  static const String name = 'sign_agreement';

  @override
  ConsumerState<SignAgreementScreen> createState() => _SignAgreementScreenState();
}

class _SignAgreementScreenState extends ConsumerState<SignAgreementScreen> {
  bool isSigned = false;

  String _agreementText(UserModel user) {
    final loc = AppLocalizations.of(context);
    final isSpanish = loc.localeName.startsWith('es');
    final isMinor = user.requiredAgreementType == UserAgreementType.minorAgreement;
    if (isSpanish) {
      return isMinor ? es.minorAgreementText : es.adultAgreementText;
    }
    return isMinor ? en.minorAgreementText : en.adultAgreementText;
  }

  @override
  Widget build(BuildContext context) {
    final currentUserAsync = ref.watch(currentUserStreamProvider);
    final controller = ref.watch(signAgreementScreenControllerProvider);
    final loc = AppLocalizations.of(context);

    ref.listen(currentUserStreamProvider, (previous, next) {
      // Navigate to event feed when user has already signed agreement
      if (next.hasValue && next.value != null && next.value!.hasSignedAgreement) {
        context.go(EventFeedScreen.path);
      }
    });

    return AnyStepScaffold(
      appBar: AnyStepAppBar(
        title: Text(loc.volunteerAgreementTitle),
        actions: const [LocaleIconButton()],
      ),
      body: MaxWidthContainer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AnyStepSpacing.md16),
            child: currentUserAsync.when(
              data: (user) {
                if (user == null) {
                  return Center(child: Text(loc.genericError));
                }
                final agreementText = _agreementText(user);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: .all(AnyStepSpacing.md12),
                        decoration: BoxDecoration(
                          border: .all(color: Theme.of(context).dividerColor),
                          borderRadius: .circular(AnyStepSpacing.md12),
                        ),
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            primary: true,
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              children: [
                                Padding(
                                  padding: .only(right: AnyStepSpacing.sm8),
                                  child: Text(
                                    agreementText,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                                Padding(
                                  padding: .only(right: AnyStepSpacing.sm8),
                                  child: CheckboxListTile(
                                    contentPadding: .zero,
                                    title: Text(loc.tapToSign),
                                    value: isSigned,
                                    onChanged: (value) {
                                      setState(() {
                                        isSigned = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: AnyStepSpacing.md16),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AnyStepSpacing.md16),
                    if (controller.hasError) ...[
                      Text(
                        '${controller.error}',
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                      ),
                      const SizedBox(height: AnyStepSpacing.sm8),
                    ],
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: !isSigned || controller.isLoading
                            ? null
                            : ref
                                  .read(signAgreementScreenControllerProvider.notifier)
                                  .signAgreement,
                        child: controller.isLoading
                            ? const CircularProgressIndicator.adaptive()
                            : Text(loc.goToEventFeed),
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator.adaptive()),
              error: (e, _) =>
                  AnyStepErrorWidget(onRetry: () => ref.refresh(currentUserStreamProvider)),
            ),
          ),
        ),
      ),
    );
  }
}
