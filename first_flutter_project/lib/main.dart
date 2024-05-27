import 'package:first_flutter_project/screens/bottom_bar.dart';
import 'package:first_flutter_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp (
      debugShowCheckedModeBanner: false,
      title: "Title Flutter",
      theme: ThemeData (
        primaryColor: primary
      ),
      home: const BottomBar(),
    );
  }

}
