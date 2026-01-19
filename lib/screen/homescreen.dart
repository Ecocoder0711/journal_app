import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal_app/data/data.dart';
import 'package:journal_app/provider/auth_provider.dart';
import 'package:journal_app/provider/journal_entry_provider.dart';
import 'package:journal_app/screen/login_page.dart';
import 'package:journal_app/widgets/general_entry_card.dart';
import 'package:journal_app/widgets/input_data_card.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  void _logout() async {
    final authService = ref.read(authServiceProvider);
    await authService.signOut();
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final entriesValue = ref.watch(journalEntryProvider);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text(
          "My Daily Thoughts",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: _logout,
            icon: Icon(Icons.logout_outlined),
            color: Colors.white,
          ),
        ],
      ),
      body: entriesValue.when(
        data: (entires) {
          if (entires.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.book_outlined, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'No journal entries yet',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the + button to add first entry',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: listOfEntry.length,
            itemBuilder: (context, index) {
              return JournalEntryCard(entry: listOfEntry[index]);
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error loading entries',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
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
                onSave: (entry) async {
                  try {
                    final service = ref.read(journalEntryServiceProvider);
                    await service.addEntry(entry);
                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Failed to save Entry: $e',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
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