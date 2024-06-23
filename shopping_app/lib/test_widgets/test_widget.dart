import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../common/widgets/images/rounded_image.dart';
import '../common/widgets/rounded_container.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/image_strings.dart';
import '../utils/helpers/helper_functions.dart';

class GifDemo extends StatefulWidget {
  const GifDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GifDemoState createState() => _GifDemoState();
}

class _GifDemoState extends State<GifDemo> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final isDark = THelperFunction.isDarkMode(context);
    
    return Scaffold(
      appBar: AppBar(title: const Text("GIF Demo")),
      body: Center(
      child: Column (
        children: [
          RoundedContainer (
            height: 180,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: isDark? TColors.dark : const Color.fromARGB(255, 139, 134, 134),
            child: const Stack (
              children: [ 
                RoundedImage(imageUrl: TImages.productImage_3, applyImageRadius: true),
              ],
            )
          ),

        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

