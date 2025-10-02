import 'dart:io';

import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({
    super.key,
    this.imageUrl,
    this.onImageSelected,
    this.shape,
    this.height = 150,
  });

  final String? imageUrl;
  final ValueChanged<XFile?>? onImageSelected;
  final BoxShape? shape;
  final double height;

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
            height: widget.height,
            width: widget.shape == BoxShape.circle ? widget.height : double.infinity,
            margin: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
            decoration: BoxDecoration(
              border: Border.all(color: AnyStepColors.gray.withAlpha(100)),
              borderRadius:
                  widget.shape == BoxShape.circle
                      ? null
                      : BorderRadius.circular(AnyStepSpacing.sm8),
              color: AnyStepColors.gray.withAlpha(100),
              shape: widget.shape ?? BoxShape.rectangle,
            ),
            child:
                _imageFile == null
                    ? (widget.imageUrl == null
                        ? const _ImagePlaceholder()
                        : _EditableImageWidget(
                          shape: widget.shape ?? BoxShape.rectangle,
                          borderRadius:
                              widget.shape == BoxShape.circle
                                  ? null
                                  : BorderRadius.circular(AnyStepSpacing.sm8),
                          onEdit: _pickImage,
                          child: Image.network(
                            widget.imageUrl!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: widget.height,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Center(child: _ImagePlaceholder()),
                          ),
                        ))
                    : _EditableImageWidget(
                      shape: widget.shape ?? BoxShape.rectangle,
                      borderRadius:
                          widget.shape == BoxShape.circle
                              ? null
                              : BorderRadius.circular(AnyStepSpacing.sm8),
                      onEdit: _pickImage,
                      child: Image.file(
                        File(_imageFile!.path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: widget.height,
                      ),
                    ),
          ),
        ),
      ],
    );
  }
}

class _EditableImageWidget extends StatelessWidget {
  const _EditableImageWidget({
    required this.child,
    required this.shape,
    this.borderRadius,
    this.onEdit,
  });

  final Widget child;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  static const double _iconSize = 20;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final clipped =
        shape == BoxShape.circle
            ? ClipOval(child: child)
            : ClipRRect(borderRadius: borderRadius ?? BorderRadius.zero, child: child);

    return Stack(
      fit: StackFit.expand,
      children: [
        clipped,
        Positioned(
          right: 6,
          bottom: 6,
          child: Material(
            color: Colors.black54,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onEdit,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: const Icon(Icons.edit, size: _iconSize, color: AnyStepColors.white),
              ),
            ),
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
