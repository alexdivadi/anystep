import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<bool> shareContent({required String content, String? title, List<XFile>? files}) async {
  final result = await SharePlus.instance.share(
    ShareParams(title: title, text: content, files: files),
  );

  return result.status == ShareResultStatus.success;
}

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, required this.text, this.title});

  final String text;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: () async => await shareContent(title: title, content: text),
    );
  }
}
