import 'package:flutter/material.dart';

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 16, 16),
        title: const Text('Projects'),
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.menu
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.more_vert
              )),
            ),
        ],
      ),
    );
  }
}