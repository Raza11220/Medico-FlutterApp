part of '../medico.dart';

// Screen 34: Image assessment (presentation mapping).
class Screen34 extends StatefulWidget {
  const Screen34({super.key});
  @override
  State<Screen34> createState() => _Screen34State();
}

class _Screen34State extends DemoPageState<Screen34> {
  @override
  Widget build(BuildContext context) {
    return shell(34, [
      heading(
        'Image assessment',
        'Illustrative result • No image analysis performed',
      ),
      info(
        'Possible skin conditions\nA real assessment would require clinical evaluation. This demo does not identify any condition.',
      ),
      section('Assessment'),
      card([
        const Text(
          'Unable to determine from this demo',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        gap(),
        const Text(
          'No photo was sent to an AI model. The same example is displayed for every sample.',
          style: TextStyle(height: 1.6),
        ),
      ]),
      tile(
        'Recommended specialist',
        'Dermatologist',
        Icons.person_search_outlined,
        () {
          demo.selectedDoctor = 2;
          go(10);
        },
      ),
      button('Book a dermatologist', () {
        demo.selectedDoctor = 2;
        go(10);
      }),
      button('Try another sample', () => go(32), outline: true),
      button('Back to home', () => root(6), outline: true),
    ]);
  }
}
