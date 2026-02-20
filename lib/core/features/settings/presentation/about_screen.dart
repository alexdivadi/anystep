import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/common/widgets/max_width_container.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const path = '/about';
  static const name = 'about';

  static const _instagramUrl = 'https://instagram.com/anystepcommunity';
  static const _facebookUrl = 'https://www.facebook.com/AnyStepCoaching';
  static const _linkedInUrl = 'https://www.linkedin.com/company/any-step-community-services/';
  static const _twitterUrl = 'https://twitter.com/Anystepcommunit';

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
    return AnyStepScaffold(
      appBar: AnyStepAppBar(
        title: Text(loc.aboutTitle),
        actions: [
          IconButton(
            tooltip: loc.aboutInstagram,
            icon: const FaIcon(FontAwesomeIcons.instagram),
            onPressed: () => _openLink(_instagramUrl),
          ),
          IconButton(
            tooltip: loc.aboutFacebook,
            icon: const FaIcon(FontAwesomeIcons.facebook),
            onPressed: () => _openLink(_facebookUrl),
          ),
          IconButton(
            tooltip: loc.aboutLinkedIn,
            icon: const FaIcon(FontAwesomeIcons.linkedin),
            onPressed: () => _openLink(_linkedInUrl),
          ),
          IconButton(
            tooltip: loc.aboutX,
            icon: const FaIcon(FontAwesomeIcons.xTwitter),
            onPressed: () => _openLink(_twitterUrl),
          ),
        ],
      ),
      body: MaxWidthContainer(
        child: ListView(
          padding: const EdgeInsets.all(AnyStepSpacing.md16),
          children: [
            Text(loc.aboutStoryTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AnyStepSpacing.md16),
            Text(loc.aboutStoryIntro, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AnyStepSpacing.md16),
            Text(loc.aboutStorySydneyTitle, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AnyStepSpacing.sm8),
            Text(loc.aboutStorySydneyBody, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AnyStepSpacing.md16),
            Text(loc.aboutStoryShermanTitle, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AnyStepSpacing.sm8),
            Text(loc.aboutStoryShermanBody, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AnyStepSpacing.md16),
            Text(loc.aboutStoryCostaRicaTitle, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AnyStepSpacing.sm8),
            Text(loc.aboutStoryCostaRicaBody, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AnyStepSpacing.md16),
            Text(loc.aboutStoryLocalTitle, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AnyStepSpacing.sm8),
            Text(loc.aboutStoryLocalBody, style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: AnyStepSpacing.xl64),
          ],
        ),
      ),
    );
  }
}
