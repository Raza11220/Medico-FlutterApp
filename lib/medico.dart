library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
part 'screens/01_splash.dart';
part 'screens/02_welcome.dart';
part 'screens/03_sign_in.dart';
part 'screens/04_create_account.dart';
part 'screens/05_patient_profile.dart';
part 'screens/06_home.dart';
part 'screens/07_symptom_checker.dart';
part 'screens/08_ai_guidance.dart';
part 'screens/09_find_doctors.dart';
part 'screens/10_doctor_profile.dart';
part 'screens/11_book_appointment.dart';
part 'screens/12_appointment_details.dart';
part 'screens/13_health_records.dart';
part 'screens/14_my_appointments.dart';
part 'screens/15_video_consultation.dart';
part 'screens/16_doctor_chat.dart';
part 'screens/17_e_prescription.dart';
part 'screens/18_reset_password.dart';
part 'screens/19_notifications.dart';
part 'screens/20_profile_settings.dart';
part 'screens/21_help_complaints.dart';
part 'screens/22_doctor_verification.dart';
part 'screens/23_doctor_dashboard.dart';
part 'screens/24_manage_availability.dart';
part 'screens/25_appointment_requests.dart';
part 'screens/26_patient_medical_history.dart';
part 'screens/27_write_prescription.dart';
part 'screens/28_admin_dashboard.dart';
part 'screens/29_verification_review.dart';
part 'screens/30_user_management.dart';
part 'screens/31_complaints_management.dart';
part 'screens/32_skin_photo.dart';
part 'screens/33_review_photo.dart';
part 'screens/34_image_assessment.dart';

const screenNames = <String>[
  'Splash',
  'Welcome',
  'Sign in',
  'Create account',
  'Patient profile',
  'Home',
  'Symptom checker',
  'AI guidance',
  'Find doctors',
  'Doctor profile',
  'Book appointment',
  'Appointment details',
  'Health records',
  'My appointments',
  'Video consultation',
  'Doctor chat',
  'E-prescription',
  'Reset password',
  'Notifications',
  'Profile & settings',
  'Help & complaints',
  'Doctor verification',
  'Doctor dashboard',
  'Manage availability',
  'Appointment requests',
  'Patient medical history',
  'Write e-prescription',
  'Admin dashboard',
  'Doctor verification review',
  'User management',
  'Complaints management',
  'Check a skin photo',
  'Review your photo',
  'Image assessment',
];
final screenBuilders = <WidgetBuilder>[
  (_) => const Screen01(),
  (_) => const Screen02(),
  (_) => const Screen03(),
  (_) => const Screen04(),
  (_) => const Screen05(),
  (_) => const Screen06(),
  (_) => const Screen07(),
  (_) => const Screen08(),
  (_) => const Screen09(),
  (_) => const Screen10(),
  (_) => const Screen11(),
  (_) => const Screen12(),
  (_) => const Screen13(),
  (_) => const Screen14(),
  (_) => const Screen15(),
  (_) => const Screen16(),
  (_) => const Screen17(),
  (_) => const Screen18(),
  (_) => const Screen19(),
  (_) => const Screen20(),
  (_) => const Screen21(),
  (_) => const Screen22(),
  (_) => const Screen23(),
  (_) => const Screen24(),
  (_) => const Screen25(),
  (_) => const Screen26(),
  (_) => const Screen27(),
  (_) => const Screen28(),
  (_) => const Screen29(),
  (_) => const Screen30(),
  (_) => const Screen31(),
  (_) => const Screen32(),
  (_) => const Screen33(),
  (_) => const Screen34(),
];

const teal = Color(0xFF00A6B5);
const navy = Color(0xFF0B2D50);
const ink = Color(0xFF11234F);
const muted = Color(0xFF657C9B);
const canvas = Color(0xFFF3F8FE);
const pale = Color(0xFFE1F5F7);

class Appointment {
  Appointment(this.doctor, this.date, this.time, {this.status = 'Requested'});
  final int doctor;
  final DateTime date;
  final String time;
  String status;
}

class DemoStore extends ChangeNotifier {
  String name = 'Ali Khan', email = 'ali@example.com', gender = 'Male';
  String role = 'Patient', allergies = 'Penicillin', dob = '12/08/2002';
  int selectedDoctor = 0, selectedAppointment = 0;
  String doctorName = 'Sara Ahmed', specialty = 'General Physician';
  String verification = 'Pending';
  final workingDays = <String, bool>{};
  final prescriptionDraft = <String, String>{};
  final appointments = <Appointment>[
    Appointment(0, DateTime.now(), '04:30 PM', status: 'Confirmed'),
  ];
  final records = <String>['Blood test report', 'Consultation summary'];
  final messages = <String>[
    'Doctor: Hello Ali. How can I help you today?',
    'You: I would like to discuss my recent report.',
    'Doctor: We can review it during your consultation.',
  ];
  final complaints = <String>['Video consultation quality'];
  final complaintStates = <String>['Open'];
  final users = <String>[
    'Ali Khan',
    'Ayesha Noor',
    'Dr. Sara Ahmed',
    'Usman Ahmed',
  ];
  final suspended = <String>{};
  final slots = <String>['09:00 AM', '10:30 AM', '04:30 PM'];
  final notifications = <String>[
    'Your consultation is confirmed',
    'Your prescription is ready',
    'Welcome to Medico',
  ];
  String prescription = 'No new prescription has been issued in this demo.';
  String notes = '', symptoms = '', sample = '';
  bool notificationEnabled = true;
  Appointment get appointment => appointments[selectedAppointment];
  void update() => notifyListeners();
}

final demo = DemoStore();
const doctors = [
  ['Dr. Sara Ahmed', 'General Physician', '4.9', '1,500'],
  ['Dr. Omar Hassan', 'Cardiologist', '4.8', '2,500'],
  ['Dr. Ayesha Khan', 'Dermatologist', '4.9', '2,000'],
];
String dateLabel(DateTime d) => '${d.day}/${d.month}/${d.year}';

class MedicoApp extends StatelessWidget {
  const MedicoApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Medico • UI Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: canvas,
      colorScheme: ColorScheme.fromSeed(
        seedColor: teal,
        primary: teal,
        secondary: navy,
      ),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: ink,
        displayColor: ink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: canvas,
        foregroundColor: ink,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFDCE7F2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFDCE7F2)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 50),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    ),
    home: const Screen01(),
  );
}

// Shared shell keeps navigation, styling and responsive behavior consistent.
abstract class DemoPageState<T extends StatefulWidget> extends State<T> {
  final values = <String, String>{};
  final formKey = GlobalKey<FormState>();
  final controllers = <String, TextEditingController>{};
  String choice = '', search = '';
  bool checked = false, toggle = true, camera = true, speaker = true;
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  @override
  void initState() {
    super.initState();
    demo.addListener(refresh);
  }

  void refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    demo.removeListener(refresh);
    for (final c in controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void go(int id) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: screenBuilders[id - 1]));
  void root(int id) => Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: screenBuilders[id - 1]),
    (_) => false,
  );
  void toast(String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  void change(VoidCallback action) {
    action();
    demo.update();
  }

  Widget gap([double h = 16]) => SizedBox(height: h);
  Widget heading(String title, [String? subtitle]) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            height: 1.15,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (subtitle != null) ...[
          gap(8),
          Text(subtitle, style: const TextStyle(color: muted, height: 1.5)),
        ],
      ],
    ),
  );
  Widget section(String title) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 12),
    child: Text(
      title,
      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
    ),
  );
  Widget info(String text, {bool warning = false}) => Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: warning ? const Color(0xFFFFF0E4) : pale,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: warning ? const Color(0xFF89500C) : navy,
        height: 1.5,
      ),
    ),
  );
  Widget card(List<Widget> children, {Color color = Colors.white}) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: const Color(0xFFE0E9F3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
  Widget button(
    String label,
    VoidCallback action, {
    bool outline = false,
    IconData? icon,
  }) => Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 4),
    child: SizedBox(
      width: double.infinity,
      child: outline
          ? OutlinedButton(onPressed: action, child: Text(label))
          : FilledButton(
              onPressed: action,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Flexible(child: Text(label, textAlign: TextAlign.center)),
                ],
              ),
            ),
    ),
  );
  Widget link(String label, VoidCallback action) =>
      TextButton(onPressed: action, child: Text(label));
  Widget field(
    String label, {
    String initial = '',
    bool required = true,
    bool email = false,
    bool password = false,
    int lines = 1,
    ValueChanged<String>? onChanged,
  }) {
    controllers.putIfAbsent(label, () => TextEditingController(text: initial));
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controllers[label],
        obscureText: password,
        maxLines: lines,
        keyboardType: email ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: lines > 1,
        ),
        onChanged: (v) {
          values[label] = v;
          onChanged?.call(v);
        },
        validator: (v) {
          if (required && (v ?? '').trim().isEmpty) {
            return 'Please enter ${label.toLowerCase()}';
          }
          if (email && !RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v ?? '')) {
            return 'Enter a valid email';
          }
          if (password && (v ?? '').length < 6) {
            return 'Use at least 6 characters';
          }
          return null;
        },
      ),
    );
  }

  String val(String label, [String fallback = '']) =>
      controllers[label]?.text.trim() ?? fallback;
  bool valid() => formKey.currentState?.validate() ?? true;
  Widget chips(
    List<String> labels,
    String selected,
    ValueChanged<String> action,
  ) => Wrap(
    spacing: 8,
    runSpacing: 6,
    children: labels
        .map(
          (s) => ChoiceChip(
            label: Text(s),
            selected: selected == s,
            onSelected: (_) => action(s),
            selectedColor: pale,
          ),
        )
        .toList(),
  );
  Widget tile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback action, {
    Widget? trailing,
  }) => Card(
    elevation: 0,
    color: Colors.white,
    margin: const EdgeInsets.only(bottom: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      leading: CircleAvatar(
        backgroundColor: pale,
        child: Icon(icon, color: teal),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(subtitle, style: const TextStyle(color: muted)),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: muted),
      onTap: action,
    ),
  );
  Widget doctorCard(int index, {VoidCallback? onTap}) => card([
    Row(
      children: [
        avatar(index),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctors[index][0],
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(doctors[index][1], style: const TextStyle(color: muted)),
              Text(
                '★ ${doctors[index][2]}  •  Rs. ${doctors[index][3]}',
                style: const TextStyle(color: teal),
              ),
            ],
          ),
        ),
      ],
    ),
    if (onTap != null) button('View profile', onTap, outline: true),
  ]);
  Widget avatar(int index, {double size = 64}) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: index == 0
        ? Image.asset(
            'assets/images/doctor-portrait.png',
            width: size,
            height: size,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          )
        : Container(
            width: size,
            height: size,
            color: pale,
            child: Icon(Icons.person_outline, size: size * .6, color: teal),
          ),
  );
  Widget kit({double size = 150}) => Image.asset(
    'assets/images/medical-kit-3d.png',
    width: size,
    height: size,
    fit: BoxFit.contain,
  );
  Widget hero(
    String title,
    String subtitle,
    String action,
    VoidCallback onTap,
  ) => Container(
    padding: const EdgeInsets.all(22),
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: navy,
      borderRadius: BorderRadius.circular(26),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            kit(size: 95),
          ],
        ),
        Text(subtitle, style: const TextStyle(color: Color(0xFFCEE9F6))),
        gap(12),
        button(action, onTap),
      ],
    ),
  );
  Widget stats(List<String> labels, List<String> numbers) => LayoutBuilder(
    builder: (context, c) => Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        labels.length,
        (i) => SizedBox(
          width: (c.maxWidth - 10) / 2,
          child: card([
            Text(
              numbers[i],
              style: const TextStyle(
                color: teal,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(labels[i], style: const TextStyle(color: muted)),
          ]),
        ),
      ),
    ),
  );
  Widget appointmentCard(int index) {
    final a = demo.appointments[index];
    return card([
      Text(
        doctors[a.doctor][0],
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      gap(6),
      Text('${dateLabel(a.date)} • ${a.time}'),
      gap(6),
      Text(
        a.status,
        style: const TextStyle(color: teal, fontWeight: FontWeight.bold),
      ),
      button('View appointment', () {
        demo.selectedAppointment = index;
        go(12);
      }),
    ]);
  }

  Future<void> pickDate() async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: now.add(const Duration(days: 365)),
    );
    if (result != null && mounted) setState(() => selectedDate = result);
  }

  Future<void> confirm(String title, VoidCallback action) async {
    final yes = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: const Text('This changes local demo data only.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Go back'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    if (yes == true && mounted) action();
  }

  void gallery() => showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(ctx).height * .8,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'All 34 screens • Presentation order',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 34,
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: pale,
                    child: Text('${i + 1}'),
                  ),
                  title: Text(screenNames[i]),
                  onTap: () {
                    Navigator.pop(ctx);
                    go(i + 1);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  Widget shell(
    int id,
    List<Widget> children, {
    bool nav = false,
    bool admin = false,
    bool dark = false,
  }) {
    final body = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: admin ? 1100 : 640),
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(22),
            children: children,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: dark ? navy : canvas,
      appBar: AppBar(
        title: Text(
          id == 6 ? 'Medico' : screenNames[id - 1],
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
            color: id == 6 ? teal : ink,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'All 34 screens',
            onPressed: gallery,
            icon: const Icon(Icons.grid_view_rounded),
          ),
          if (id == 6)
            IconButton(
              tooltip: 'Notifications',
              onPressed: () => go(19),
              icon: const Icon(Icons.notifications_none),
            ),
        ],
      ),
      body: SafeArea(
        child: admin
            ? LayoutBuilder(
                builder: (context, c) => c.maxWidth >= 800
                    ? Row(
                        children: [
                          SizedBox(width: 215, child: adminMenu(id)),
                          Expanded(child: body),
                        ],
                      )
                    : body,
              )
            : body,
      ),
      drawer: admin ? Drawer(child: SafeArea(child: adminMenu(id))) : null,
      bottomNavigationBar: nav
          ? NavigationBar(
              selectedIndex: id == 9
                  ? 1
                  : id == 14
                  ? 2
                  : id == 13
                  ? 3
                  : 0,
              onDestinationSelected: (i) => root([6, 9, 14, 13][i]),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_search_outlined),
                  label: 'Doctors',
                ),
                NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined),
                  label: 'Visits',
                ),
                NavigationDestination(
                  icon: Icon(Icons.description_outlined),
                  label: 'Records',
                ),
              ],
            )
          : null,
    );
  }

  Widget adminMenu(int selected) => Container(
    color: navy,
    child: ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Medico\nAdmin workspace',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (final id in [28, 29, 30, 31])
          ListTile(
            selected: selected == id,
            selectedTileColor: teal,
            title: Text(
              screenNames[id - 1],
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () => root(id),
          ),
        ListTile(
          title: const Text(
            'Switch role',
            style: TextStyle(color: Colors.white70),
          ),
          onTap: () => root(3),
        ),
      ],
    ),
  );
}
