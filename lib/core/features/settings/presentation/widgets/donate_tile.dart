import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonateTile extends StatelessWidget {
  const DonateTile({super.key});

  static const _donateUrl = 'https://www.anystepcommunity.com/donate-1';

  Future<void> _openLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        Log.e('Failed to open external link: $uri');
      }
    } catch (e) {
      Log.e('Error opening external link', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ListTile(
      leading: const Icon(Icons.volunteer_activism),
      title: Text(loc.donate),
      trailing: const Icon(Icons.open_in_new),
      onTap: () => _openLink(_donateUrl),
    );
  }
}
