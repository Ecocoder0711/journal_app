import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal_app/provider/auth_provider.dart';
import 'package:journal_app/screen/homescreen.dart';
import 'package:journal_app/screen/login_page.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authstate = ref.watch(authStateProvider);
    return authstate.when(
      data: (user) => user != null ? const Homepage() : const LoginPage(),
      error: (er, stack) =>
          Scaffold(body: Center(child: Text("Something went wrong $er"))),
      loading: () => const Scaffold(body: Center(child: CircleAvatar())),
    );
  }
}
