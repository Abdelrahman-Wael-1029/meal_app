import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget getImage({required String url, double? height, double? width, BoxFit fit = BoxFit.cover}) {
  return CachedNetworkImage(
    imageUrl: url,
    fit: fit,
    height: height,
    width: width,
  );
}
