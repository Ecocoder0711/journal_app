import 'package:flutter/material.dart';
import 'package:journal_app/model/journal_entry_model.dart';

class JournalEntryCard extends StatelessWidget {
  final JournalEntry entry;
  const JournalEntryCard({required this.entry, super.key});

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
              entry.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            Text(
              entry.content,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 3),
            Text(
              entry.date,
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
