import 'dart:io';

import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({super.key, this.imageUrl, this.onImageSelected});

  final String? imageUrl;
  final ValueChanged<XFile?>? onImageSelected;

  @override
  State<ImageUploadWidget> createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
    if (widget.onImageSelected != null) {
      widget.onImageSelected!(_imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            height: 150,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
            decoration: BoxDecoration(
              border: Border.all(color: AnyStepColors.gray.withAlpha(100)),
              borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
              color: AnyStepColors.gray.withAlpha(100),
            ),
            child:
                _imageFile == null
                    ? (widget.imageUrl == null
                        ? const _ImagePlaceholder()
                        : _EditableImageWidget(
                          child: Image.network(
                            widget.imageUrl!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150,
                          ),
                        ))
                    : _EditableImageWidget(
                      child: Image.file(
                        File(_imageFile!.path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150,
                      ),
                    ),
          ),
        ),
      ],
    );
  }
}

class _EditableImageWidget extends StatelessWidget {
  const _EditableImageWidget({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(AnyStepSpacing.sm8), child: child),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: const Icon(Icons.edit, color: AnyStepColors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.image, size: AnyStepSpacing.lg48, color: AnyStepColors.gray),
        SizedBox(height: AnyStepSpacing.sm8),
        Text('Tap to pick image', style: TextStyle(color: AnyStepColors.gray)),
      ],
    );
  }
}
