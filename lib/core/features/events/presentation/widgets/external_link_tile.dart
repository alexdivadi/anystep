import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinkTile extends StatelessWidget {
  const ExternalLinkTile({super.key, required this.url, required this.label});

  final String url;
  final String label;

  Uri? _buildUri() {
    final trimmed = url.trim();
    if (trimmed.isEmpty) return null;
    final parsed = Uri.tryParse(trimmed);
    if (parsed == null) return null;
    if (parsed.hasScheme) return parsed;
    return Uri.tryParse('https://$trimmed');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.open_in_new),
      title: Text(url),
      onTap: () async {
        final uri = _buildUri();
        if (uri == null) return;
        try {
          final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
          if (!launched) {
            Log.e('Failed to open external link: $uri');
          }
        } catch (e) {
          Log.e('Error opening external link', e);
        }
      },
    );
  }
}
