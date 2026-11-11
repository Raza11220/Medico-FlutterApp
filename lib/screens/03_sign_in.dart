part of '../medico.dart';

// Screen 03: Sign in (presentation mapping).
class Screen03 extends StatefulWidget {
  const Screen03({super.key});
  @override
  State<Screen03> createState() => _Screen03State();
}

class _Screen03State extends DemoPageState<Screen03> {
  @override
  Widget build(BuildContext context) {
    return shell(3, [
      Center(child: kit(size: 110)),
      heading('Welcome back', 'Sign in to continue your care journey.'),
      chips(
        ['Patient', 'Doctor', 'Admin'],
        demo.role,
        (v) => change(() => demo.role = v),
      ),
      gap(),
      field('Email address', email: true),
      field('Password', password: true),
      Align(
        alignment: Alignment.centerRight,
        child: link('Forgot password?', () => go(18)),
      ),
      button('Sign in', () {
        if (!valid()) return;
        demo.email = val('Email address');
        root(
          demo.role == 'Doctor'
              ? 23
              : demo.role == 'Admin'
              ? 28
              : 6,
        );
      }),
      button(
        'Explore ${demo.role.toLowerCase()} demo',
        () => root(
          demo.role == 'Doctor'
              ? 23
              : demo.role == 'Admin'
              ? 28
              : 6,
        ),
        outline: true,
      ),
      link('Create an account', () => go(4)),
      info(
        'Demo sign-in accepts any valid email and a password of 6+ characters. Do not enter a real password.',
      ),
    ]);
  }
}
