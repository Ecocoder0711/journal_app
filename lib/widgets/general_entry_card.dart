import 'package:flutter/material.dart';

class JournalEntryCard extends StatelessWidget {
  const JournalEntryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 190, 186, 186),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            Text(
              "Content: ",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 3),
            Text(
              "10 Nov 2025",
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(255, 120, 119, 119),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
