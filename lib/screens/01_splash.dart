part of '../medico.dart';

// Screen 01: Splash (presentation mapping).
class Screen01 extends StatefulWidget {
  const Screen01({super.key});
  @override
  State<Screen01> createState() => _Screen01State();
}

class _Screen01State extends DemoPageState<Screen01> {
  @override
  Widget build(BuildContext context) {
    return shell(1, [
      gap(40),
      Center(child: kit(size: 220)),
      const Text(
        'Medico',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.w800,
        ),
      ),
      gap(),
      const Text(
        'Care that connects.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white70, fontSize: 18),
      ),
      gap(70),
      const Text(
        'Your care. Your time. Your Medico.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white70),
      ),
      button('Get started', () => go(2)),
      gap(),
      const Text(
        'Offline UI prototype',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white60),
      ),
    ], dark: true);
  }
}
