part of '../medico.dart';

// Screen 10: Doctor profile (presentation mapping).
class Screen10 extends StatefulWidget {
  const Screen10({super.key});
  @override
  State<Screen10> createState() => _Screen10State();
}

class _Screen10State extends DemoPageState<Screen10> {
  @override
  Widget build(BuildContext context) {
    final d = doctors[demo.selectedDoctor];
    return shell(10, [
      Center(child: avatar(demo.selectedDoctor, size: 180)),
      gap(),
      heading(d[0], '${d[1]} • Demo verified profile'),
      const Text('★ 4.9  •  120 reviews', style: TextStyle(color: teal)),
      gap(),
      stats(['Experience', 'Patients'], ['8 years', '1,200+']),
      section('About'),
      const Text(
        'A caring specialist focused on clear communication, thoughtful consultations and patient wellbeing.',
        style: TextStyle(height: 1.6),
      ),
      info('Video consultation • Rs. ${d[3]}'),
      button('Book appointment', () => go(11)),
    ]);
  }
}
