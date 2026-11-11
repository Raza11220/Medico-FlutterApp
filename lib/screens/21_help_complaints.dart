part of '../medico.dart';

// Screen 21: Help & complaints (presentation mapping).
class Screen21 extends StatefulWidget {
  const Screen21({super.key});
  @override
  State<Screen21> createState() => _Screen21State();
}

class _Screen21State extends DemoPageState<Screen21> {
  @override
  Widget build(BuildContext context) {
    return shell(21, [
      heading('How can we help?', 'Send a sample support request.'),
      info(
        'For this UI demonstration, complaints appear in the local admin workspace.',
      ),
      field('Subject'),
      field('Your message', lines: 5),
      button('Submit complaint', () {
        if (!valid()) return;
        change(() {
          demo.complaints.add('${val('Subject')}: ${val('Your message')}');
          demo.complaintStates.add('Open');
        });
        toast('Complaint added to the demo admin inbox.');
        controllers['Subject']!.clear();
        controllers['Your message']!.clear();
      }),
      section('Frequently asked questions'),
      const ExpansionTile(
        title: Text('How do I book an appointment?'),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Open Find doctors, select a doctor, choose a date and slot, then confirm.',
            ),
          ),
        ],
      ),
      const ExpansionTile(
        title: Text('Is this connected to Firebase?'),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'No. This version is an offline, interactive UI prototype.',
            ),
          ),
        ],
      ),
    ]);
  }
}
