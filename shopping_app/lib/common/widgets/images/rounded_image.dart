
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({super.key, 
    this.border, 
    this.padding, 
    this.onPressed, 
    this.width, 
    this.height, 
    this.applyImageRadius = true, 
    required this.imageUrl, 
    this.fit = BoxFit.fill, 
    this.backgroundColor = TColors.light, 
    this.isNetworkImage = false, 
    this.borderRadius = TSizes.md
  });

  final double? width, height;
  final BoxFit? fit;
  final String imageUrl;
  final BoxBorder? border;
  final bool isNetworkImage;
  final double borderRadius;
  final bool applyImageRadius ;
  final Color backgroundColor;
  final VoidCallback? onPressed; 
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(

          borderRadius: applyImageRadius? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(fit: fit, image: isNetworkImage? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider ),

        ),

      ),

    );
    
  }
}