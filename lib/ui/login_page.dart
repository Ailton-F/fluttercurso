import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';


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
  bool? validUserState;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showpass() {
    setState(() {
      if (passViewState) {
        passViewState = false;
      } else {
        passViewState = true;
      }
    });
  }

  void validUser(TextEditingController nameController,
      TextEditingController passController) {
    setState(() {
      String username = nameController.text;
      String password = passController.text;

      if (username == 'AiltonXDZ' && password == 'Seila@123') {
        validUserState = true;
      } else {
        validUserState = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
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
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
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
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        )
                      )
                    ),
                    onPressed: () {
                      validUser(usernameController, passwordController);
                      validUserState == false
                          ? showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => const CupertinoAlertDialog(
                                    title:
                                        Text('Senha ou usuário incorreto(s)'),
                                    content:
                                        Text('Por favor, tente novamente.'),
                                    actions: [
                                      CupertinoDialogAction(child: Text('ok')),
                                    ],
                                  ))
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AppHomePage()));
                    },
                    child: const Text('Entrar'))
              ],
            )));
  }
}
