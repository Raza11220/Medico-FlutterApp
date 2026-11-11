part of '../medico.dart';

// Screen 18: Reset password (presentation mapping).
class Screen18 extends StatefulWidget {
  const Screen18({super.key});
  @override
  State<Screen18> createState() => _Screen18State();
}

class _Screen18State extends DemoPageState<Screen18> {
  @override
  Widget build(BuildContext context) {
    return shell(18, [
      heading(
        'Forgot your password?',
        'Preview the reset flow with your email address.',
      ),
      const Center(child: Icon(Icons.lock_reset, size: 85, color: teal)),
      gap(24),
      field('Email address', email: true),
      button('Preview reset link', () {
        if (valid()) setState(() => checked = true);
      }),
      if (checked)
        info(
          'Reset confirmation shown. No email has been sent because this is an offline UI demo.',
        ),
      link('Back to sign in', () => go(3)),
    ]);
  }
}
