part of '../medico.dart';

// Screen 14: My appointments (presentation mapping).
class Screen14 extends StatefulWidget {
  const Screen14({super.key});
  @override
  State<Screen14> createState() => _Screen14State();
}

class _Screen14State extends DemoPageState<Screen14> {
  @override
  Widget build(BuildContext context) {
    final filter = choice.isEmpty ? 'Upcoming' : choice;
    return shell(14, [
      heading('My appointments', 'Keep track of your care journey.'),
      chips(
        ['Upcoming', 'Completed', 'Cancelled'],
        filter,
        (v) => setState(() => choice = v),
      ),
      gap(),
      for (var i = 0; i < demo.appointments.length; i++)
        if (filter == 'Upcoming'
            ? ['Requested', 'Confirmed'].contains(demo.appointments[i].status)
            : filter == 'Completed'
            ? demo.appointments[i].status == 'Completed'
            : ['Cancelled', 'Rejected'].contains(demo.appointments[i].status))
          appointmentCard(i),
      button('Book another appointment', () => go(9)),
      info(
        'Appointments update across the patient and doctor workspaces during this session.',
      ),
    ], nav: true);
  }
}
