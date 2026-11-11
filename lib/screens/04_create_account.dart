part of '../medico.dart';

// Screen 04: Create account (presentation mapping).
class Screen04 extends StatefulWidget {
  const Screen04({super.key});
  @override
  State<Screen04> createState() => _Screen04State();
}

class _Screen04State extends DemoPageState<Screen04> {
  @override
  Widget build(BuildContext context) {
    return shell(4, [
      heading('Let’s get you started', 'Create your Medico demo profile.'),
      chips(
        ['Patient', 'Doctor'],
        demo.role == 'Admin' ? 'Patient' : demo.role,
        (v) => change(() => demo.role = v),
      ),
      gap(),
      field('Full name'),
      field('Email address', email: true),
      field('Password', password: true),
      field('Confirm password', password: true),
      CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('I understand this is a UI demo.'),
        value: checked,
        onChanged: (v) => setState(() => checked = v ?? false),
      ),
      button('Create account', () {
        if (!valid()) return;
        if (val('Password') != val('Confirm password')) {
          toast('Passwords must match.');
          return;
        }
        if (!checked) {
          toast('Please select the checkbox.');
          return;
        }
        change(() {
          demo.name = val('Full name');
          demo.email = val('Email address');
        });
        go(demo.role == 'Doctor' ? 22 : 5);
      }),
      link('Already registered? Sign in', () => go(3)),
    ]);
  }
}
