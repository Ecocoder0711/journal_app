import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:journal_app/model/journal_entry_model.dart';

class JournalEntryServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // add new entry

  Future<void> addEntry(JournalEntry entry) async {
    try {
      final String uid = _auth.currentUser!.uid;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('entries')
          .add(entry.toMap());
    } catch (e) {
      throw Exception("Not able to Entry : $e");
    }
  }

  // get Entries
  Stream<List<JournalEntry>> getEntries() {
    try {
      return _firestore
          .collection('users')
          .doc('uid')
          .collection('entries')
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => JournalEntry.fromFirestore(doc))
                .toList(),
          );
    } catch (e) {
      throw Exception();
    }
  }
}
