part of '../medico.dart';

// Screen 05: Patient profile (presentation mapping).
class Screen05 extends StatefulWidget {
  const Screen05({super.key});
  @override
  State<Screen05> createState() => _Screen05State();
}

class _Screen05State extends DemoPageState<Screen05> {
  @override
  Widget build(BuildContext context) {
    return shell(5, [
      heading(
        'Tell us about yourself',
        'A few details help personalize your care.',
      ),
      const Center(
        child: CircleAvatar(
          radius: 40,
          backgroundColor: pale,
          child: Icon(Icons.person_outline, color: teal, size: 45),
        ),
      ),
      gap(24),
      field('Full name', initial: demo.name),
      field('Date of birth', initial: demo.dob),
      section('Gender'),
      chips(
        ['Male', 'Female', 'Other'],
        choice.isEmpty ? demo.gender : choice,
        (v) => setState(() => choice = v),
      ),
      gap(20),
      field(
        'Allergies / medical history',
        initial: demo.allergies,
        required: false,
        lines: 3,
      ),
      button('Save profile', () {
        if (!valid()) return;
        change(() {
          demo.name = val('Full name');
          demo.dob = val('Date of birth');
          demo.gender = choice.isEmpty ? demo.gender : choice;
          demo.allergies = val('Allergies / medical history');
        });
        root(6);
      }),
    ]);
  }
}
