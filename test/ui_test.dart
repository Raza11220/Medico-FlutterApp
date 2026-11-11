import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medico/medico.dart';

void main() {
  for (final size in [const Size(390, 844), const Size(320, 568)]) {
    testWidgets('All 34 screens render at $size', (tester) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (var i = 0; i < screenBuilders.length; i++) {
        await tester.pumpWidget(
          MaterialApp(home: Builder(builder: screenBuilders[i])),
        );
        await tester.pumpAndSettle();
        expect(
          tester.takeException(),
          isNull,
          reason: 'Screen ${i + 1}: ${screenNames[i]}',
        );
        // Visit content below the fold too, not just the first viewport.
        final scroll = find.byType(Scrollable).first;
        await tester.drag(scroll, const Offset(0, -500));
        await tester.pumpAndSettle();
        expect(
          tester.takeException(),
          isNull,
          reason: 'Scrolled screen ${i + 1}',
        );
        await tester.pumpWidget(const SizedBox());
      }
    });
  }
  testWidgets('Sign-in validates empty credentials', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Screen03()));
    await tester.pumpAndSettle();
    final button = find.widgetWithText(FilledButton, 'Sign in');
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.text('Please enter email address'), findsOneWidget);
  });
  testWidgets('Doctor accepts a requested appointment', (tester) async {
    demo.appointments.clear();
    demo.appointments.add(Appointment(0, DateTime.now(), '10:30 AM'));
    demo.selectedAppointment = 0;
    await tester.pumpWidget(const MaterialApp(home: Screen25()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Accept request'));
    await tester.pumpAndSettle();
    expect(demo.appointment.status, 'Confirmed');
    expect(find.text('Confirmed'), findsOneWidget);
  });
  testWidgets('Chat adds local message', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: Screen16()));
    await tester.pumpAndSettle();
    final scroll = find.byType(Scrollable).first;
    await tester.drag(scroll, const Offset(0, -300));
    await tester.pumpAndSettle();

    final input = find.byType(TextFormField).first;
    await tester.enterText(input, 'Hello doctor');
    await tester.tap(find.text('Send message'));
    await tester.pumpAndSettle();
    expect(demo.messages.last, 'You: Hello doctor');
  });
}
