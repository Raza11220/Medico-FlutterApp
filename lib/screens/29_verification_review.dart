part of '../medico.dart';

// Screen 29: Doctor verification review (presentation mapping).
class Screen29 extends StatefulWidget {
  const Screen29({super.key});
  @override
  State<Screen29> createState() => _Screen29State();
}

class _Screen29State extends DemoPageState<Screen29> {
  @override
  Widget build(BuildContext context) {
    return shell(29, [
      heading('Doctor verification', 'Review professional credentials.'),
      card([
        Row(
          children: [
            avatar(0),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Dr. ${demo.doctorName}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        gap(),
        Text('Specialty: ${demo.specialty}'),
        const Text(
          'Registration: DEMO-12345\nQualification: MBBS, FCPS',
          style: TextStyle(height: 1.7),
        ),
        info('Current status: ${demo.verification}'),
        button(
          'Preview sample certificate',
          () => showDialog<void>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Sample certificate'),
              content: const Text(
                'DEMO DOCUMENT\nRegistration DEMO-12345\nThis is not a real medical credential.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
          outline: true,
        ),
        button(
          'Approve doctor',
          () => change(() => demo.verification = 'Approved'),
        ),
        button(
          'Reject application',
          () => confirm(
            'Reject this application?',
            () => change(() => demo.verification = 'Rejected'),
          ),
          outline: true,
        ),
      ]),
      info('Review results update the doctor workspace during this session.'),
    ], admin: true);
  }
}
