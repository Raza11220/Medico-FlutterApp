part of '../medico.dart';

// Screen 28: Admin dashboard.
class Screen28 extends StatefulWidget {
  const Screen28({super.key});
  @override
  State<Screen28> createState() => _Screen28State();
}

class _Screen28State extends DemoPageState<Screen28> {
  @override
  Widget build(BuildContext context) {
    final heights = [60.0, 95.0, 75.0, 125.0, 85.0, 55.0, 65.0];
    return shell(28, [
      heading('Admin dashboard', 'A clear view of the Medico demo workspace.'),
      stats(
        ['Users', 'Doctors', 'Appointments', 'Open complaints'],
        [
          '${demo.users.length}',
          '${doctors.length}',
          '${demo.appointments.length}',
          '${demo.complaintStates.where((s) => s == 'Open').length}',
        ],
      ),
      section('Consultation trends • Sample data'),
      card([
        SizedBox(
          height: 165,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              7,
              (i) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: heights[i],
                        decoration: BoxDecoration(
                          color: i == 3 ? teal : const Color(0xFF9CDBE0),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      gap(6),
                      Text(['M', 'T', 'W', 'T', 'F', 'S', 'S'][i]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      tile(
        'Doctor verification',
        '${demo.verification} • Dr. ${demo.doctorName}',
        Icons.verified_user_outlined,
        () => go(29),
      ),
      tile(
        'User management',
        'Search, suspend and restore demo users',
        Icons.people_outline,
        () => go(30),
      ),
      tile(
        'Complaints management',
        'Review and resolve local support requests',
        Icons.support_agent,
        () => go(31),
      ),
      button('Switch workspace', () => root(3), outline: true),
    ], admin: true);
  }
}
