import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customNetworkImage(String path,{BoxFit fit = BoxFit.contain, Widget placeholder}){
  assert(path!=null);
  return CachedNetworkImage(
    fit: fit,
    imageUrl: path,
    placeholderFadeInDuration: Duration(milliseconds: 500),
    placeholder: (context, url) => Container(
      color: Color(0xffeeeeee),
    ),
    errorWidget: (context, url, error) => placeholder != null ? placeholder : Icon(Icons.error),
  );
}