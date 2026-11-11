part of '../medico.dart';

// Screen 15: Video consultation (presentation mapping).
class Screen15 extends StatefulWidget {
  const Screen15({super.key});
  @override
  State<Screen15> createState() => _Screen15State();
}

class _Screen15State extends DemoPageState<Screen15> {
  @override
  Widget build(BuildContext context) {
    return shell(15, [
      info(
        'Simulated call • Sample doctor image. Camera and microphone are not accessed.',
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: camera
            ? Image.asset(
                'assets/images/doctor-portrait.png',
                height: 360,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )
            : Container(
                height: 360,
                color: navy,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.videocam_off,
                  size: 80,
                  color: Colors.white,
                ),
              ),
      ),
      gap(),
      Text(
        doctors[demo.appointment.doctor][0],
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      const Text(
        'Demo consultation • Preview mode',
        style: TextStyle(color: muted),
      ),
      gap(),
      Wrap(
        spacing: 12,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: [
          FilledButton.tonalIcon(
            onPressed: () => setState(() => toggle = !toggle),
            icon: Icon(toggle ? Icons.mic : Icons.mic_off),
            label: Text(toggle ? 'Mute' : 'Unmute'),
          ),
          FilledButton.tonalIcon(
            onPressed: () => setState(() => camera = !camera),
            icon: Icon(camera ? Icons.videocam : Icons.videocam_off),
            label: const Text('Camera'),
          ),
          FilledButton.tonalIcon(
            onPressed: () => setState(() => speaker = !speaker),
            icon: Icon(speaker ? Icons.volume_up : Icons.volume_off),
            label: const Text('Speaker'),
          ),
        ],
      ),
      button('Open chat', () => go(16), outline: true),
      button('End demo call', () {
        toast('Demo call ended.');
        Navigator.pop(context);
      }),
    ]);
  }
}
