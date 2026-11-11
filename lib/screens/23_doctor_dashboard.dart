part of '../medico.dart';

// Screen 23: Doctor dashboard (presentation mapping).
class Screen23 extends StatefulWidget {
  const Screen23({super.key});
  @override
  State<Screen23> createState() => _Screen23State();
}

class _Screen23State extends DemoPageState<Screen23> {
  @override
  Widget build(BuildContext context) {
    return shell(23, [
      heading(
        'Good morning, Dr. ${demo.doctorName.split(' ').first}',
        'Here’s your practice overview.',
      ),
      stats(
        ['Appointments', 'Requests'],
        [
          '${demo.appointments.length}',
          '${demo.appointments.where((a) => a.status == 'Requested').length}',
        ],
      ),
      hero(
        'Your next patient',
        '${demo.name} • Demo consultation',
        'View patient history',
        () => go(26),
      ),
      tile(
        'Appointment requests',
        'Accept, reject or complete consultations',
        Icons.assignment_outlined,
        () => go(25),
      ),
      tile(
        'Manage availability',
        'Set your working hours and time slots',
        Icons.calendar_month_outlined,
        () => go(24),
      ),
      tile(
        'Write e-prescription',
        'Create a demonstration prescription',
        Icons.note_add_outlined,
        () => go(27),
      ),
      tile(
        'Professional verification',
        demo.verification,
        Icons.verified_outlined,
        () => go(22),
      ),
      button('Open consultation demo', () => go(15)),
      button('Switch workspace', () => root(3), outline: true),
    ]);
  }
}
