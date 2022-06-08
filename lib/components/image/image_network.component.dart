import 'package:application/components/loading/circular.component.dart';
import 'package:application/modules/theme.module.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.emptyHeight,
    this.loadingSize = 50,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String? imageUrl;
  final double? width;
  final double? height;
  final double? emptyHeight;
  final double? loadingSize;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? Container(
            width: double.infinity,
            height: emptyHeight ?? height,
            color: Palettes.naturally,
            child: Icon(
              FlutterRemix.error_warning_line,
              color: Palettes.nyctophile,
              size: 40,
            ),
          )
        : CachedNetworkImage(
            fit: fit,
            width: width,
            height: height,
            imageUrl: imageUrl!,
            progressIndicatorBuilder: (context, url, progress) =>
                LoadingCircular(size: loadingSize),
            errorWidget: (context, url, error) => SizedBox(
              width: width,
              height: height,
              child: Icon(
                FlutterRemix.error_warning_line,
                color: Palettes.black,
              ),
            ),
          );
  }
}
