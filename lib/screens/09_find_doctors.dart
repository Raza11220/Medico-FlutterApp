part of '../medico.dart';

// Screen 09: Find doctors (presentation mapping).
class Screen09 extends StatefulWidget {
  const Screen09({super.key});
  @override
  State<Screen09> createState() => _Screen09State();
}

class _Screen09State extends DemoPageState<Screen09> {
  @override
  Widget build(BuildContext context) {
    final filter = choice.isEmpty ? 'All' : choice;
    return shell(9, [
      heading(
        'Find your doctor',
        'Care from specialists you can connect with.',
      ),
      field(
        'Search doctors',
        required: false,
        onChanged: (v) => setState(() => search = v),
      ),
      chips(
        ['All', 'General', 'Heart', 'Skin'],
        filter,
        (v) => setState(() => choice = v),
      ),
      gap(),
      for (var i = 0; i < doctors.length; i++)
        if ((filter == 'All' ||
                i == ['General', 'Heart', 'Skin'].indexOf(filter)) &&
            doctors[i].join(' ').toLowerCase().contains(search.toLowerCase()))
          doctorCard(
            i,
            onTap: () {
              demo.selectedDoctor = i;
              go(10);
            },
          ),
      if (!doctors.any(
        (d) => d.join(' ').toLowerCase().contains(search.toLowerCase()),
      ))
        info('No matching doctors. Try a different name.'),
    ], nav: true);
  }
}
