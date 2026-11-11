part of '../medico.dart';

// Screen 32: Check a skin photo (presentation mapping).
class Screen32 extends StatefulWidget {
  const Screen32({super.key});
  @override
  State<Screen32> createState() => _Screen32State();
}

class _Screen32State extends DemoPageState<Screen32> {
  @override
  Widget build(BuildContext context) {
    return shell(32, [
      heading(
        'A clearer next step',
        'Preview the skin photo assessment journey.',
      ),
      card([
        const Center(
          child: Icon(Icons.add_a_photo_outlined, size: 85, color: teal),
        ),
        gap(),
        const Center(child: Text('Take a clear, well-lit photo')),
        gap(),
        button('Use sample camera photo', () {
          demo.sample = 'Camera sample';
          go(33);
        }),
        button('Use sample gallery photo', () {
          demo.sample = 'Gallery sample';
          go(33);
        }, outline: true),
      ]),
      info(
        'Camera and gallery are simulated for the lab demo. No personal photos are accessed or uploaded.',
      ),
      info(
        'This feature cannot diagnose a skin condition. The next screen shows an illustrative result.',
        warning: true,
      ),
    ]);
  }
}
