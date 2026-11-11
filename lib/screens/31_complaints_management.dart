part of '../medico.dart';

// Screen 31: Complaints management (presentation mapping).
class Screen31 extends StatefulWidget {
  const Screen31({super.key});
  @override
  State<Screen31> createState() => _Screen31State();
}

class _Screen31State extends DemoPageState<Screen31> {
  @override
  Widget build(BuildContext context) {
    return shell(31, [
      heading('Complaints management', 'Review and resolve support requests.'),
      for (var i = 0; i < demo.complaints.length; i++)
        card([
          Text(
            'Ticket #${1001 + i}',
            style: const TextStyle(color: teal, fontWeight: FontWeight.bold),
          ),
          gap(8),
          Text(
            demo.complaints[i],
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          info('Status: ${demo.complaintStates[i]}'),
          button(
            demo.complaintStates[i] == 'Resolved'
                ? 'Reopen complaint'
                : 'Mark resolved',
            () => change(
              () => demo.complaintStates[i] =
                  demo.complaintStates[i] == 'Resolved' ? 'Open' : 'Resolved',
            ),
          ),
        ]),
      info(
        'Submit a complaint from patient Help & complaints to add another ticket.',
      ),
    ], admin: true);
  }
}
