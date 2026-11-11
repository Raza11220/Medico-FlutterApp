part of '../medico.dart';

// Screen 08: AI guidance (presentation mapping).
class Screen08 extends StatefulWidget {
  const Screen08({super.key});
  @override
  State<Screen08> createState() => _Screen08State();
}

class _Screen08State extends DemoPageState<Screen08> {
  @override
  Widget build(BuildContext context) {
    return shell(8, [
      const Center(
        child: Icon(Icons.health_and_safety_outlined, size: 80, color: teal),
      ),
      heading(
        'A doctor can help\nyou decide.',
        'Illustrative guidance • not an AI-generated result',
      ),
      info(
        'Your entered symptoms: ${demo.symptoms.isEmpty ? 'No symptoms entered' : demo.symptoms}',
      ),
      section('Suggested next step'),
      tile(
        'General Physician',
        'Discuss your symptoms with a professional',
        Icons.person_outline,
        () {
          demo.selectedDoctor = 0;
          go(10);
        },
      ),
      info(
        'This screen shows a fixed sample, regardless of symptoms. No medical assessment has been performed.',
      ),
      button('Find a doctor', () => go(9)),
      button('Edit symptoms', () => go(7), outline: true),
    ]);
  }
}
