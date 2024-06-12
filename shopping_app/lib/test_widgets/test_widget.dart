import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text("GIF Demo")),
      body: Center(
        child: Container(
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/images/delivery.gif")
              )
          ),
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

