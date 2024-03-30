import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  CustomCachedNetworkImage(
      {Key? key, required this.url, this.fit, this.margin, this.borderRadius})
      : super(key: key);

  final String url;
  final BoxFit? fit;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return url.isEmpty
        ? Container(
            width: MediaQuery.of(context).size.width,
            margin: margin,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Icon(Icons.error_outline)),
          )
        : CachedNetworkImage(
            imageUrl: url,
            fit: fit,
            imageBuilder: (context, imageProvider) => Container(
              width: MediaQuery.of(context).size.width,
              margin: margin,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: imageProvider, fit: fit ?? BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => Container(
              width: MediaQuery.of(context).size.width,
              margin: margin,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: margin,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: Icon(Icons.error_outline)),
              );
            },
          );
  }
}
