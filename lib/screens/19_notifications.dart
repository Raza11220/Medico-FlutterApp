part of '../medico.dart';

// Screen 19: Notifications (presentation mapping).
class Screen19 extends StatefulWidget {
  const Screen19({super.key});
  @override
  State<Screen19> createState() => _Screen19State();
}

class _Screen19State extends DemoPageState<Screen19> {
  @override
  Widget build(BuildContext context) {
    return shell(19, [
      heading('Stay up to date', 'Your appointment and account updates.'),
      button('Mark all as read', () {
        setState(() => checked = true);
        toast('All notifications marked as read.');
      }, outline: true),
      for (final n in demo.notifications)
        tile(
          n,
          checked ? 'Read' : 'New • Demo update',
          checked ? Icons.drafts_outlined : Icons.notifications_active_outlined,
          () {
            setState(() => checked = true);
            go(n.toLowerCase().contains('prescription') ? 17 : 14);
          },
        ),
    ]);
  }
}
