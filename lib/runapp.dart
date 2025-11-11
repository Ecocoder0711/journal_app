import 'package:flutter/material.dart';
import 'package:journal_app/screen/homescreen.dart';

class JournalApp extends StatelessWidget {
  const JournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Journal app", home: const Homepage());
  }
}
