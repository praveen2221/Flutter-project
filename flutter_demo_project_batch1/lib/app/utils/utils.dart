import 'dart:typed_data';
import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor/image_editor.dart';

//Image Crop

class UtilsPage {
  static Future<Uint8List?> cropImageDataWithNativeLibrary(
      {required ExtendedImageEditorState state}) async {
    Rect cropRect = state.getCropRect()!;
    if (state.widget.extendedImageState.imageProvider is ExtendedResizeImage) {
      final ImmutableBuffer buffer =
          await ImmutableBuffer.fromUint8List(state.rawImageData);
      final ImageDescriptor descriptor = await ImageDescriptor.encoded(buffer);

      final double widthRatio = descriptor.width / state.image!.width;
      final double heightRatio = descriptor.height / state.image!.height;
      cropRect = Rect.fromLTRB(
        cropRect.left * widthRatio,
        cropRect.top * heightRatio,
        cropRect.right * widthRatio,
        cropRect.bottom * heightRatio,
      );
    }

    final EditActionDetails action = state.editAction!;

    final int rotateAngle = action.rotateAngle.toInt();
    final bool flipHorizontal = action.flipY;
    final bool flipVertical = action.flipX;
    final Uint8List img = state.rawImageData;

    final ImageEditorOption option = ImageEditorOption();

    if (action.needCrop) {
      option.addOption(ClipOption.fromRect(cropRect));
    }

    if (action.needFlip) {
      option.addOption(
          FlipOption(horizontal: flipHorizontal, vertical: flipVertical));
    }

    if (action.hasRotateAngle) {
      option.addOption(RotateOption(rotateAngle));
    }

    final Uint8List? result = await ImageEditor.editImage(
      image: img,
      imageEditorOption: option,
    );
    return result;
  }

  static showLoadingDialog() {
    Get.dialog(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 100,
              width: Get.width / 3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                // child: CircularProgressIndicator(),
                child: Image.asset('assets/images/loading.gif'),
              ),
            ),
          ],
        ),
        barrierDismissible: false);
  }

}
