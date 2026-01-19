import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal_app/model/journal_entry_model.dart';
import 'package:journal_app/services/journal_entry_services.dart';

// Service Provider
final journalEntryServiceProvider = Provider<JournalEntryServices>(
  (ref) => JournalEntryServices(ref),
);

// Entries stream Provider
final journalEntryProvider = StreamProvider<List<JournalEntry>>((ref) {
  final service = ref.read(journalEntryServiceProvider);
  return service.getEntries();
});
