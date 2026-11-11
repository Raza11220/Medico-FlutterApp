part of '../medico.dart';

// Screen 20: Profile & settings (presentation mapping).
class Screen20 extends StatefulWidget {
  const Screen20({super.key});
  @override
  State<Screen20> createState() => _Screen20State();
}

class _Screen20State extends DemoPageState<Screen20> {
  @override
  Widget build(BuildContext context) {
    return shell(20, [
      heading(demo.name, demo.email),
      tile(
        'Personal information',
        'Name, date of birth and medical history',
        Icons.person_outline,
        () => go(5),
      ),
      tile(
        'Medical records',
        'Your reports and prescriptions',
        Icons.folder_outlined,
        () => go(13),
      ),
      SwitchListTile(
        title: const Text('Notifications'),
        subtitle: const Text('Demo preference'),
        value: demo.notificationEnabled,
        onChanged: (v) => change(() => demo.notificationEnabled = v),
      ),
      tile(
        'Help & complaints',
        'We are here to help',
        Icons.help_outline,
        () => go(21),
      ),
      tile(
        'Switch workspace',
        'Patient, Doctor or Admin',
        Icons.swap_horiz,
        () => root(3),
      ),
      button(
        'Sign out',
        () => confirm('Sign out of the demo?', () => root(3)),
        outline: true,
      ),
      info('All changes are held in memory and reset when the app restarts.'),
    ]);
  }
}
