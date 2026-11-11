part of '../medico.dart';

// Screen 24: Manage availability (presentation mapping).
class Screen24 extends StatefulWidget {
  const Screen24({super.key});
  @override
  State<Screen24> createState() => _Screen24State();
}

class _Screen24State extends DemoPageState<Screen24> {
  @override
  Widget build(BuildContext context) {
    return shell(24, [
      heading('Your working hours', 'Manage your weekly availability.'),
      for (final day in [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ])
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(day),
          subtitle: Text(
            demo.workingDays[day] == false
                ? 'Unavailable'
                : '09:00 AM – 05:00 PM',
          ),
          value: demo.workingDays[day] != false,
          onChanged: (v) => change(() => demo.workingDays[day] = v),
        ),
      section('Bookable slots'),
      Wrap(
        spacing: 8,
        children: demo.slots
            .map(
              (s) => InputChip(
                label: Text(s),
                onDeleted: () => change(() => demo.slots.remove(s)),
              ),
            )
            .toList(),
      ),
      button('Add time slot', () async {
        final t = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 11, minute: 0),
        );
        if (t == null || !context.mounted) return;
        final text = t.format(context);
        if (demo.slots.contains(text)) {
          toast('This time already exists.');
          return;
        }
        change(() => demo.slots.add(text));
      }, outline: true),
      button('Save availability', () {
        demo.update();
        toast('Availability saved for this session.');
      }),
      info(
        'Slot changes appear on Book appointment. Weekly hours are a demo preference.',
      ),
    ]);
  }
}
