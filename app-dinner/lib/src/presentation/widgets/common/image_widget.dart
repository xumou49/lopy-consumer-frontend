import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imageUrl,
    this.height = double.infinity,
  }) : super(key: key);

  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: double.infinity,
      height: height,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
                color: Colors.grey.shade300, value: downloadProgress.progress)),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
