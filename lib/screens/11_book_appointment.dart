part of '../medico.dart';

// Screen 11: Book appointment (presentation mapping).
class Screen11 extends StatefulWidget {
  const Screen11({super.key});
  @override
  State<Screen11> createState() => _Screen11State();
}

class _Screen11State extends DemoPageState<Screen11> {
  @override
  Widget build(BuildContext context) {
    return shell(11, [
      doctorCard(demo.selectedDoctor),
      section('Select a date'),
      tile(
        dateLabel(selectedDate),
        'Tap to choose a date',
        Icons.calendar_month,
        pickDate,
      ),
      section('Available times'),
      chips(demo.slots, choice, (v) => setState(() => choice = v)),
      gap(),
      info(
        'Video consultation • 30 minutes\nConsultation fee: Rs. ${doctors[demo.selectedDoctor][3]}\nNo payment is taken in this demo.',
      ),
      button('Confirm appointment', () {
        if (choice.isEmpty) {
          toast('Please choose a time.');
          return;
        }
        if (demo.appointments.any(
          (a) =>
              a.doctor == demo.selectedDoctor &&
              dateLabel(a.date) == dateLabel(selectedDate) &&
              a.time == choice &&
              a.status != 'Cancelled' &&
              a.status != 'Rejected',
        )) {
          toast('This slot is already booked in the demo.');
          return;
        }
        change(() {
          demo.appointments.add(
            Appointment(demo.selectedDoctor, selectedDate, choice),
          );
          demo.selectedAppointment = demo.appointments.length - 1;
          demo.notifications.insert(0, 'New appointment requested');
        });
        go(12);
      }),
    ]);
  }
}
