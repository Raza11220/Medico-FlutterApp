part of '../medico.dart';

// Screen 26: Patient medical history (presentation mapping).
class Screen26 extends StatefulWidget {
  const Screen26({super.key});
  @override
  State<Screen26> createState() => _Screen26State();
}

class _Screen26State extends DemoPageState<Screen26> {
  @override
  Widget build(BuildContext context) {
    return shell(26, [
      heading(demo.name, 'Patient medical history • Demo record'),
      info(
        'Allergies: ${demo.allergies.isEmpty ? 'None recorded' : demo.allergies}',
        warning: true,
      ),
      section('Medical overview'),
      card([
        Text('Date of birth: ${demo.dob}'),
        Text('Gender: ${demo.gender}'),
        gap(),
        const Text(
          'Past consultation: General check-up\nAll content is sample information.',
          style: TextStyle(height: 1.6),
        ),
      ]),
      section('Recent records'),
      for (final r in demo.records)
        tile(
          r,
          'Sample health document',
          Icons.description_outlined,
          () => go(13),
        ),
      button('Write prescription', () => go(27)),
      button('Open patient chat', () => go(16), outline: true),
    ]);
  }
}
