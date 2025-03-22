import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/constants/my_app_constants.dart';

class CacheNetworkWidget extends StatelessWidget {
  const CacheNetworkWidget(
      {super.key, this.url, this.width, this.height, this.boxfit});
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? boxfit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      imageUrl: url ?? MyAppConstants.url,
      fit: boxfit ?? BoxFit.cover,
      height: height ?? size.height * 0.2,
      width: width ?? size.width * 0.3,
    );
  }
}
