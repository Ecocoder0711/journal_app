import 'package:flutter/material.dart';

class InputDataCard extends StatefulWidget {
  const InputDataCard({super.key});

  @override
  State<InputDataCard> createState() => _InputDataCardState();
}

class _InputDataCardState extends State<InputDataCard> {
  // text editing controllers
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _contentEditingController = TextEditingController();
  // function to print data
  void printdata() {
    print(_titleEditingController.text);
    print(_contentEditingController.text);
    _titleEditingController.clear();
    _contentEditingController.clear();
  }

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
              controller: _titleEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
                labelText: "Title",
                hintText: "Enter the tile: ",
                hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _contentEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
                labelText: "Content",
                hintText: "Enter the Content: ",
                hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            // ElevatedButton(onPressed: printdata, child: Text("Print Data")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: printdata,
                  child: Text(
                    "Saved Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Cancel", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
