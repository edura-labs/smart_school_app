import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../constants/assets.dart';

class MyImage extends StatelessWidget {
  final String? url;
  final double? height, width;
  final double radius;
  final Widget? errorWidget;
  final Alignment? alignment;
  final BoxFit? fit;
  final Widget Function(BuildContext, String)? placeholder;
  const MyImage({
    super.key,
    this.url,
    this.radius = 10,
    this.errorWidget,
    this.height,
    this.width,
    this.alignment,
    this.placeholder,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: url == null
            ? ''
            :
            // url!.startsWith("https")
            //     ?
            url!,
        // : Api.authBaseUrl + url!,
        width: width ?? media.width,
        height: height ?? media.height,
        alignment: alignment ?? Alignment.center,
        placeholder: placeholder,
        errorListener: (value) => Assets.placeholderImage,
        fadeInCurve: Curves.easeIn,
        fadeOutCurve: Curves.easeInOut,
        filterQuality: FilterQuality.high,
        fit: fit ?? BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child:
                CupertinoActivityIndicator(color: colorScheme.inversePrimary)),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Icon(
              Icons.error,
              color: kPrimaryColor,
            ),
      ),
    );
  }
}
