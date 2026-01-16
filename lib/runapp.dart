import 'package:flutter/material.dart';
import 'package:journal_app/screen/auth_wrapper.dart';

class JournalApp extends StatelessWidget {
  const JournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Journal app",
      home: AuthWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
