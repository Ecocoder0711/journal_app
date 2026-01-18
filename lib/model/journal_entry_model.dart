import 'package:cloud_firestore/cloud_firestore.dart';

class JournalEntry {
  final String id;
  final String title;
  final String content;
  final String date;

  JournalEntry({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "content": content, "date": date};
  }

  JournalEntry.fromMap(Map<String, dynamic> map)
    : id = map["id"],
      title = map["title"],
      content = map["content"],
      date = map["date"];

  factory JournalEntry.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return JournalEntry(
      id: doc.id,
      title: data['title'],
      content: data['content'],
      date: data['date'],
    );
  }
}
