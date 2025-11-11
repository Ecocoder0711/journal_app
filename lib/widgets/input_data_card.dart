import 'package:flutter/material.dart';

class InputDataCard extends StatefulWidget {
  const InputDataCard({super.key});

  @override
  State<InputDataCard> createState() => _InputDataCardState();
}

class _InputDataCardState extends State<InputDataCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 800,
        width: 385,
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
                labelText: "Title",
                hintText: "Enter the tile: ",
                hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
