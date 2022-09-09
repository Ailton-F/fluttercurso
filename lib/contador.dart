import 'package:flutter/material.dart';
import 'package:fluttercurso/home_page.dart';

class ContadorPage extends StatelessWidget {
  const ContadorPage({Key? key}) : super(key: key);
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
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 51, 51, 51),
      fixedSize: const Size(60, 40),
      foregroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Black-wallpapers.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  count == 20 ? 'Máximo atingido!' : 'Pode entrar!',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 11, 187, 25),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(count.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 11, 187, 25),
                    )),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: count == 0 ? null : decrement,
                        style: buttonStyle,
                        child: const Text(
                          'Saiu',
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: count == 20 ? null : increment,
                      style: buttonStyle,
                      child: const Text('Entrou'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const AppHomePage())));
                        },
                        style: buttonStyle,
                        child: const Text('Voltar'),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
