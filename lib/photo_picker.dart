import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 't_image.dart';

/// 职责：
/// 1、展示完整的图片；
/// 2、提供切换图片的功能；
class PhotoPickerPage extends StatelessWidget {
  final String fileUrl;
  final double? height;
  final double? width;

  const PhotoPickerPage(this.fileUrl, {this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TImage(fileUrl, height: height, width: width),
    );
  }
}
