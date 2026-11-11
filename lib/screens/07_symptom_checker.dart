part of '../medico.dart';

// Screen 07: Symptom checker (presentation mapping).
class Screen07 extends StatefulWidget {
  const Screen07({super.key});
  @override
  State<Screen07> createState() => _Screen07State();
}

class _Screen07State extends DemoPageState<Screen07> {
  @override
  Widget build(BuildContext context) {
    return shell(7, [
      Center(child: kit(size: 110)),
      heading(
        'What’s bothering you?',
        'Describe your symptoms to preview the guidance flow.',
      ),
      field('Describe your symptoms', lines: 4),
      section('Suggested symptoms'),
      Wrap(
        spacing: 8,
        children: ['Headache', 'Fatigue', 'Cough']
            .map(
              (s) => ActionChip(
                label: Text(s),
                onPressed: () {
                  final c = controllers['Describe your symptoms']!;
                  c.text = c.text.isEmpty ? s : '${c.text}, $s';
                },
              ),
            )
            .toList(),
      ),
      gap(),
      field('How long has this been happening?', initial: '2 days'),
      info(
        'Illustrative UI only. This demo does not analyze symptoms or provide a diagnosis.',
      ),
      button('View sample guidance', () {
        if (!valid()) return;
        change(() => demo.symptoms = val('Describe your symptoms'));
        go(8);
      }),
    ]);
  }
}
