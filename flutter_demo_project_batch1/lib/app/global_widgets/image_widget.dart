import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? url;
  final String? placeholder;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  const ImageWidget(
      {super.key,
      this.url,
      this.height,
      this.width,
      this.boxFit,
      this.placeholder = 'assets/images/brand-placeholder-v2.png'});
  @override
  Widget build(BuildContext context) {
    if (url != null && url != '') {
      return FadeInImage.assetNetwork(
        image: url ?? '',
        placeholder: 'assets/images/brand-placeholder-v2.png',
        fit: boxFit,
        placeholderFit: BoxFit.scaleDown,
        placeholderScale: 0.2,
        height: height,
        width: width,
      );
    } else {
      return url != null && url != ""
          ? Image.network(
              url!,
              height: height,
              width: width,
              fit: boxFit,
            )
          : Center(
              child: Image.asset(
                placeholder!,
                fit: BoxFit.fitHeight,
                height: height,
                width: width,
              ),
            );
    }
  }
}
