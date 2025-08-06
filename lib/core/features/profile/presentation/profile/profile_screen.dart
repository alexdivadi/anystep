import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_form.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  static const path = '/profile';

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool isEditing = false;

  void _logout() async {
    await ref.read(authRepositoryProvider).logout();
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(currentUserStreamProvider);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(
        title: const Text('Profile'),
        actions: [
          isEditing
              ? IconButton(
                icon: const Icon(Icons.edit_off),
                onPressed:
                    () => setState(() {
                      isEditing = false;
                    }),
              )
              : IconButton(
                icon: const Icon(Icons.edit),
                onPressed:
                    () => setState(() {
                      isEditing = true;
                    }),
              ),
        ],
      ),
      body: userAsync.when(
        loading: () => const Center(child: AnyStepLoadingIndicator()),
        error:
            (e, st) => RefreshIndicator(
              onRefresh: () async => ref.invalidate(currentUserStreamProvider),
              child: ScrollableCenteredContent(child: AnyStepErrorWidget()),
            ),
        data: (user) {
          if (user == null) {
            return const Center(child: AnyStepLoadingIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  isEditing
                      ? ProfileForm(
                        user: user,
                        onCancel:
                            () => setState(() {
                              isEditing = false;
                            }),
                        onSaved: () {
                          setState(() {
                            isEditing = false;
                          });
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ref.invalidate(currentUserStreamProvider);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Profile updated successfully',
                                  style: const TextStyle(color: AnyStepColors.white),
                                ),
                                backgroundColor: AnyStepColors.success,
                              ),
                            );
                          });
                        },
                      )
                      : ProfileInfo(user: user),

                  const SizedBox(height: AnyStepSpacing.md12),
                  if (!isEditing)
                    ElevatedButton.icon(
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Theme.of(context).colorScheme.onError,
                      ),
                      onPressed: _logout,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
