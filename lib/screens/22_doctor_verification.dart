part of '../medico.dart';

// Screen 22: Doctor verification (presentation mapping).
class Screen22 extends StatefulWidget {
  const Screen22({super.key});
  @override
  State<Screen22> createState() => _Screen22State();
}

class _Screen22State extends DemoPageState<Screen22> {
  @override
  Widget build(BuildContext context) {
    return shell(22, [
      heading('Join Medico care', 'Complete your professional profile.'),
      info('Verification status: ${demo.verification}'),
      field('Full name', initial: demo.doctorName),
      field('Specialty', initial: demo.specialty),
      field('Registration number', initial: 'DEMO-12345'),
      field('Qualifications', initial: 'MBBS, FCPS'),
      button(
        checked ? 'Sample certificate attached ✓' : 'Attach sample certificate',
        () => setState(() => checked = true),
        outline: true,
      ),
      button('Submit for verification', () {
        if (!valid()) return;
        if (!checked) {
          toast('Attach the sample certificate first.');
          return;
        }
        change(() {
          demo.doctorName = val('Full name');
          demo.specialty = val('Specialty');
          demo.verification = 'Pending';
        });
        toast('Submitted. Open Admin → Doctor verification to review.');
        go(23);
      }),
      info(
        'No document is uploaded. This action uses a demonstration certificate.',
      ),
    ]);
  }
}
