part of '../medico.dart';

// Screen 12: Appointment details (presentation mapping).
class Screen12 extends StatefulWidget {
  const Screen12({super.key});
  @override
  State<Screen12> createState() => _Screen12State();
}

class _Screen12State extends DemoPageState<Screen12> {
  @override
  Widget build(BuildContext context) {
    final a = demo.appointment;
    final active = a.status == 'Confirmed' || a.status == 'Requested';
    return shell(12, [
      const Center(
        child: Icon(Icons.check_circle_outline, size: 72, color: teal),
      ),
      heading(
        'Appointment ${a.status.toLowerCase()}',
        'Your consultation details, all in one place.',
      ),
      doctorCard(a.doctor),
      info('${dateLabel(a.date)} • ${a.time}\nVideo consultation • 30 minutes'),
      if (a.status == 'Confirmed') ...[
        button('Join video call demo', () => go(15)),
        button('Message doctor', () => go(16), outline: true),
      ],
      if (a.status == 'Requested')
        info(
          'Switch to Doctor workspace → Appointment requests to accept this booking.',
        ),
      if (active)
        button(
          'Cancel appointment',
          () => confirm(
            'Cancel this appointment?',
            () => change(() => a.status = 'Cancelled'),
          ),
          outline: true,
        ),
      button('My appointments', () => go(14), outline: true),
    ]);
  }
}
