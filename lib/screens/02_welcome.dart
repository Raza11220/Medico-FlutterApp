part of '../medico.dart';

// Screen 02: Welcome (presentation mapping).
class Screen02 extends StatefulWidget {
  const Screen02({super.key});
  @override
  State<Screen02> createState() => _Screen02State();
}

class _Screen02State extends DemoPageState<Screen02> {
  @override
  Widget build(BuildContext context) {
    return shell(2, [
      Center(
        child: Image.asset('assets/images/medico-logo.png', width: 160, height: 70),
      ),
      gap(20),
      Center(child: kit(size: 250)),
      heading(
        'Better care,\ncloser to you.',
        'Find a doctor, book a consultation and keep your health in one place.',
      ),
      button('Get started', () => go(4)),
      button('I already have an account', () => go(3), outline: true),
      info(
        'Patient, doctor and admin demo workspaces. No real accounts or backend services are connected.',
      ),
    ]);
  }
}
