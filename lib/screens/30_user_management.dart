part of '../medico.dart';

// Screen 30: User management (presentation mapping).
class Screen30 extends StatefulWidget {
  const Screen30({super.key});
  @override
  State<Screen30> createState() => _Screen30State();
}

class _Screen30State extends DemoPageState<Screen30> {
  @override
  Widget build(BuildContext context) {
    return shell(30, [
      heading('User management', 'Manage access to the demo workspace.'),
      field(
        'Search users',
        required: false,
        onChanged: (v) => setState(() => search = v),
      ),
      for (final u in demo.users.where(
        (u) => u.toLowerCase().contains(search.toLowerCase()),
      ))
        card([
          Text(
            u,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            demo.suspended.contains(u) ? 'Suspended' : 'Active',
            style: TextStyle(
              color: demo.suspended.contains(u) ? Colors.deepOrange : teal,
            ),
          ),
          button(
            demo.suspended.contains(u) ? 'Restore user' : 'Suspend user',
            () => confirm(
              'Change access for $u?',
              () => change(() {
                if (demo.suspended.contains(u)) {
                  demo.suspended.remove(u);
                } else {
                  demo.suspended.add(u);
                }
              }),
            ),
            outline: true,
          ),
        ]),
      if (!demo.users.any(
        (u) => u.toLowerCase().contains(search.toLowerCase()),
      ))
        info('No users match your search.'),
      info(
        'Status changes demonstrate administration only; there is no authentication backend.',
      ),
    ], admin: true);
  }
}
