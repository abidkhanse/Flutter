import 'package:first_flutter_project/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),

      body: Center(
        child: ElevatedButton(
          child: Text("Go to second page"),

          onPressed: () {
            Navigator.pushNamed(context, '/second_page');

            /*  Navigator.push(
                context,
                MaterialPageRoute(builder:
                    (context) => SecondPage()
                ),
            );
            */
          },
        )
      ),
    );
  }
}