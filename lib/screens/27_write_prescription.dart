part of '../medico.dart';

// Screen 27: Write e-prescription (presentation mapping).
class Screen27 extends StatefulWidget {
  const Screen27({super.key});
  @override
  State<Screen27> createState() => _Screen27State();
}

class _Screen27State extends DemoPageState<Screen27> {
  @override
  Widget build(BuildContext context) {
    return shell(27, [
      heading('For ${demo.name}', 'Create a demonstration e-prescription.'),
      info(
        'UI exercise only. Use fictional medication names and instructions.',
      ),
      field(
        'Clinical notes',
        initial: demo.prescriptionDraft['Clinical notes'] ?? '',
        required: false,
        lines: 2,
      ),
      field(
        'Medicine name',
        initial: demo.prescriptionDraft['Medicine name'] ?? 'Demo medicine A',
      ),
      field(
        'Dosage',
        initial: demo.prescriptionDraft['Dosage'] ?? 'Sample dosage',
      ),
      field(
        'Frequency and duration',
        initial:
            demo.prescriptionDraft['Frequency and duration'] ??
            'Sample schedule',
      ),
      field(
        'Patient instructions',
        initial: demo.prescriptionDraft['Patient instructions'] ?? '',
        required: false,
        lines: 3,
      ),
      button('Save draft', () {
        if (valid()) {
          for (final entry in controllers.entries) {
            demo.prescriptionDraft[entry.key] = entry.value.text;
          }
          toast('Draft saved for this session.');
        }
      }, outline: true),
      button('Publish demo prescription', () {
        if (!valid()) return;
        change(() {
          demo.prescription =
              '${val('Medicine name')}\n${val('Dosage')}\n${val('Frequency and duration')}';
          demo.notes = val('Patient instructions');
          demo.notifications.insert(0, 'Your prescription is ready');
        });
        go(17);
      }),
    ]);
  }
}
