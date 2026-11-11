part of '../medico.dart';

// Screen 25: Appointment requests (presentation mapping).
class Screen25 extends StatefulWidget {
  const Screen25({super.key});
  @override
  State<Screen25> createState() => _Screen25State();
}

class _Screen25State extends DemoPageState<Screen25> {
  @override
  Widget build(BuildContext context) {
    return shell(25, [
      heading('Your booking requests', 'Manage your consultation schedule.'),
      for (var i = 0; i < demo.appointments.length; i++)
        card([
          Text(
            demo.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(
            '${dateLabel(demo.appointments[i].date)} • ${demo.appointments[i].time}',
          ),
          Text(
            demo.appointments[i].status,
            style: const TextStyle(color: teal),
          ),
          if (demo.appointments[i].status == 'Requested') ...[
            button(
              'Accept request',
              () => change(() {
                demo.appointments[i].status = 'Confirmed';
                demo.notifications.insert(0, 'Your consultation is confirmed');
              }),
            ),
            button(
              'Reject request',
              () => confirm(
                'Reject this request?',
                () => change(() => demo.appointments[i].status = 'Rejected'),
              ),
              outline: true,
            ),
          ],
          if (demo.appointments[i].status == 'Confirmed')
            button(
              'Mark completed',
              () => change(() => demo.appointments[i].status = 'Completed'),
            ),
          button('View patient history', () {
            demo.selectedAppointment = i;
            go(26);
          }, outline: true),
        ]),
      button('Doctor dashboard', () => root(23), outline: true),
    ]);
  }
}
