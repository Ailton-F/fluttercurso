import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool passViewState = true;

  void showpass() {
    setState(() {
      if (passViewState) {
        passViewState = false;
      } else {
        passViewState = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(255, 245, 35, 35),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: passViewState,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffix: IconButton(
                        onPressed: showpass,
                        icon: Icon(
                          passViewState == true
                              ? Icons.remove_red_eye
                              : Icons.password,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const ElevatedButton(onPressed: null, child: Text('Entrar'))
              ],
            )));
  }
}
