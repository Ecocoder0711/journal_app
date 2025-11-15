import 'package:flutter/material.dart';
import 'package:journal_app/data/data.dart';
import 'package:journal_app/widgets/general_entry_card.dart';
import 'package:journal_app/widgets/input_data_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text(
          "Welcome To Daily Thoughts",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: listOfEntry.length,
        itemBuilder: (context, index) {
          return JournalEntryCard(entry: listOfEntry[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return InputDataCard(
                onSave: (entry) {
                  setState(() {
                    listOfEntry.add(entry);
                  });
                },
              );
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 49, 49, 49),
        child: const Icon(Icons.add, color: Color.fromARGB(255, 208, 203, 203)),
      ),
    );
  }
}
// body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       for (int i = 0; i <= 40; i++)
      //         Container(
      //           height: 40,
      //           width: 400,
      //           color: Colors.amber,
      //           child: Text("This is Container no $i"),
                
      //         ),
      //     ],
      //   ),
      // ),