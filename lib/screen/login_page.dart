import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal_app/widgets/responsive_widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final TextEditingController passwordEditingControler =
        TextEditingController();
    final TextEditingController emailEditingControler = TextEditingController();

    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, Constraints) {
          final screenWidth = Constraints.maxWidth;
          final isdesktop = screenWidth > 900;
          final isTablet = screenWidth > 600 && screenWidth <= 900;
          final isMobile = screenWidth < 600;
          double getHorizontalPadding() {
            if (isdesktop) return screenWidth * 0.3;
            if (isTablet) return screenWidth * 0.2;
            return 20;
          }

          double getFormWidth() {
            if (isdesktop) return 400;
            if (isTablet) return screenWidth * 0.6;
            return screenWidth - 48;
          }

          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: getHorizontalPadding()),
              child: Container(
                width: getFormWidth(),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Form(key: _formkey, child: Column()),
              ),
            ),
          );
        },
      ),
    );
  }
}
