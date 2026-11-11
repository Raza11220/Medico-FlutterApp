part of '../medico.dart';

// Screen 13: Health records (presentation mapping).
class Screen13 extends StatefulWidget {
  const Screen13({super.key});
  @override
  State<Screen13> createState() => _Screen13State();
}

class _Screen13State extends DemoPageState<Screen13> {
  @override
  Widget build(BuildContext context) {
    return shell(13, [
      heading(
        'Your care, in one place',
        'Reports, prescriptions and consultation notes.',
      ),
      chips(
        ['All', 'Prescriptions', 'Reports'],
        choice.isEmpty ? 'All' : choice,
        (v) => setState(() => choice = v),
      ),
      gap(),
      if (choice != 'Reports')
        tile(
          'E-prescription',
          'View your latest prescription',
          Icons.receipt_long,
          () => go(17),
        ),
      if (choice != 'Prescriptions') ...[
        for (final r in demo.records)
          tile(
            r,
            'Sample record • Stored for this session',
            Icons.description_outlined,
            () => showDialog<void>(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text(r),
                content: const Text(
                  'Demo document preview. No real health data is stored or interpreted.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
      ],
      button(
        'Add sample report',
        () => change(
          () => demo.records.add('Sample report ${demo.records.length + 1}'),
        ),
        outline: true,
      ),
      info(
        'Adding a sample report demonstrates the upload flow without accessing your files.',
      ),
    ], nav: true);
  }
}
