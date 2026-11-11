part of '../medico.dart';

// Screen 17: E-prescription (presentation mapping).
class Screen17 extends StatefulWidget {
  const Screen17({super.key});
  @override
  State<Screen17> createState() => _Screen17State();
}

class _Screen17State extends DemoPageState<Screen17> {
  @override
  Widget build(BuildContext context) {
    return shell(17, [
      info(
        'Your care, documented.\nDemonstration prescription • Not for clinical use.',
      ),
      card([
        const Text(
          'Medico',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: teal,
          ),
        ),
        gap(),
        Text('Patient: ${demo.name}'),
        Text('Doctor: Dr. ${demo.doctorName}'),
        Text('Date: ${dateLabel(DateTime.now())}'),
        const Divider(height: 32),
        const Text(
          'Prescription',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        gap(),
        Text(demo.prescription, style: const TextStyle(height: 1.7)),
        gap(),
        Text(
          'Instructions: ${demo.notes.isEmpty ? 'No instructions added.' : demo.notes}',
        ),
      ]),
      button('Copy prescription text', () async {
        await Clipboard.setData(
          ClipboardData(text: 'DEMO ONLY\n${demo.prescription}\n${demo.notes}'),
        );
        if (mounted) toast('Copied to clipboard.');
      }),
      info(
        'The UI demo uses a clipboard export. PDF generation is not connected.',
      ),
      button('Health records', () => go(13), outline: true),
    ]);
  }
}
