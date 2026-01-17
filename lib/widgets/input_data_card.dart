import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journal_app/data/data.dart';
import 'package:journal_app/model/journal_entry_model.dart';

class InputDataCard extends StatefulWidget {
  final Function(JournalEntry) onSave;
  const InputDataCard({required this.onSave, super.key});

  @override
  State<InputDataCard> createState() => _InputDataCardState();
}

class _InputDataCardState extends State<InputDataCard> {
  // text editing controllers
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController =
      TextEditingController();
  // function to print data
  // void printdata() {
  //   print(_titleEditingController.text);
  //   print(_contentEditingController.text);
  //   _titleEditingController.clear();
  //   _contentEditingController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 236, 236),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(25),
        height: 730,
        width: 385,
        // color: Colors.white,
        child: Column(
          children: [
            TextField(
              controller: _titleEditingController,
              decoration: const InputDecoration(
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
              decoration: const InputDecoration(
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    JournalEntry entry = JournalEntry(
                      id: "${listOfEntry.length}",
                      title: _titleEditingController.text,
                      content: _contentEditingController.text,
                      date: DateFormat('dd MMM y').format(DateTime.now()),
                    );
                    widget.onSave(entry);
                    // setState(() {
                    //  listOfEntry.add(entry);
                    // });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Saved Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
