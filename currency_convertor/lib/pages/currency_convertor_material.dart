import 'package:flutter/material.dart';

class CurrencyConvertorMaterial extends StatefulWidget {
  const CurrencyConvertorMaterial({super.key});
  @override
  State<CurrencyConvertorMaterial> createState() => _CurrencyConvertMaterialPageState();
}

class _CurrencyConvertMaterialPageState extends State<CurrencyConvertorMaterial> {

  final TextEditingController textEditingController = TextEditingController();
  double result = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderSide: const BorderSide (
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(20),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              result.toStringAsFixed(3),
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue
              ),
            ),

            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "SEK to PKR",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.attach_money, color: Colors.grey,),
                    focusedBorder: border,
                    enabledBorder: border
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true
                ),
              ),
            ),

            Container (

              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {
                setState(() {
                  result = double.parse(textEditingController.text) * 26.5;
                });
              },
                  style: TextButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50)
                  ),
                  child: const Text("Convert")
              ),
            )
          ],
        ),
      ),
    );
  }
}
