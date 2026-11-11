part of '../medico.dart';

// Screen 33: Review your photo (presentation mapping).
class Screen33 extends StatefulWidget {
  const Screen33({super.key});
  @override
  State<Screen33> createState() => _Screen33State();
}

class _Screen33State extends DemoPageState<Screen33> {
  @override
  Widget build(BuildContext context) {
    return shell(33, [
      heading('Ready for review?', 'Check the sample before continuing.'),
      card([
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF1D6BF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Icon(
              Icons.image_outlined,
              size: 85,
              color: Color(0xFFAC7D63),
            ),
          ),
        ),
        gap(),
        Text(
          '${demo.sample.isEmpty ? 'Demonstration' : demo.sample} • Illustration only',
        ),
      ]),
      field('Describe your concern', required: false, lines: 3),
      CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text(
          'I understand this shows a fixed sample result, not a diagnosis.',
        ),
        value: checked,
        onChanged: (v) => setState(() => checked = v ?? false),
      ),
      button('View sample assessment', () {
        if (!checked) {
          toast('Please acknowledge the demo notice.');
          return;
        }
        go(34);
      }),
      button('Choose another sample', () => go(32), outline: true),
    ]);
  }
}
