part of '../medico.dart';

// Screen 06: Home (presentation mapping).
class Screen06 extends StatefulWidget {
  const Screen06({super.key});
  @override
  State<Screen06> createState() => _Screen06State();
}

class _Screen06State extends DemoPageState<Screen06> {
  @override
  Widget build(BuildContext context) {
    return shell(6, [
      Align(
        alignment: Alignment.centerRight,
        child: link('My profile', () => go(20)),
      ),
      heading(
        'Good morning, ${demo.name.split(' ').first}',
        'Here’s your health overview for today.',
      ),
      hero(
        'How are you\nfeeling today?',
        'Get guidance on your next step.',
        'Check symptoms',
        () => go(7),
      ),
      section('Browse by specialty'),
      Wrap(
        spacing: 10,
        children: [
          for (final item in ['General', 'Heart', 'Skin'])
            ActionChip(
              avatar: const Icon(
                Icons.medical_services_outlined,
                color: teal,
                size: 19,
              ),
              label: Text(item),
              onPressed: () {
                demo.selectedDoctor = item == 'Heart'
                    ? 1
                    : item == 'Skin'
                    ? 2
                    : 0;
                go(9);
              },
            ),
        ],
      ),
      section('Your upcoming appointment'),
      appointmentCard(demo.selectedAppointment),
      tile(
        'Check a skin photo',
        'Explore the illustrative photo assessment',
        Icons.add_a_photo_outlined,
        () => go(32),
      ),
      tile(
        'Doctor chat',
        'Keep your conversation in one place',
        Icons.chat_bubble_outline,
        () => go(16),
      ),
    ], nav: true);
  }
}
