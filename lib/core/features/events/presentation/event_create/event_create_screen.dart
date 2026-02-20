import 'package:anystep/core/common/utils/snackbar_message.dart';
import 'package:anystep/core/common/widgets/any_step_app_bar.dart';
import 'package:anystep/core/common/widgets/any_step_scaffold.dart';
import 'package:anystep/core/common/widgets/max_width_container.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  static const path = '/events/create';
  static const name = 'event-create';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.createEvent)),
      body: MaxWidthContainer(
        child: SafeArea(
          child: EventDetailForm(
            physics: const AlwaysScrollableScrollPhysics(),
            showAddressNameField: true,
            onSuccess: () {
              if (!context.mounted) return;
              context.showSuccessSnackbar(loc.eventCreated);
              context.pop();
            },
          ),
        ),
      ),
    );
  }
}
