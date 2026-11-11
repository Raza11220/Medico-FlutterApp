part of '../medico.dart';

// Screen 16: Doctor chat (presentation mapping).
class Screen16 extends StatefulWidget {
  const Screen16({super.key});
  @override
  State<Screen16> createState() => _Screen16State();
}

class _Screen16State extends DemoPageState<Screen16> {
  @override
  Widget build(BuildContext context) {
    return shell(16, [
      doctorCard(demo.appointment.doctor),
      info('Local demo conversation. Messages are not sent to another device.'),
      for (final m in demo.messages)
        Align(
          alignment: m.startsWith('You:')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 340),
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: m.startsWith('You:') ? pale : Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(m, style: const TextStyle(height: 1.5)),
          ),
        ),
      field('Type a message', required: false),
      button('Send message', () {
        final text = val('Type a message');
        if (text.isEmpty) {
          toast('Type a message first.');
          return;
        }
        change(() => demo.messages.add('You: $text'));
        controllers['Type a message']!.clear();
      }),
      button(
        'Add sample doctor reply',
        () => change(
          () => demo.messages.add(
            'Doctor: Thank you. We can discuss this at your appointment.',
          ),
        ),
        outline: true,
      ),
    ]);
  }
}
