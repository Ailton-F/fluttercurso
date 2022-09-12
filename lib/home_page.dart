import 'package:flutter/material.dart';
import 'package:fluttercurso/contador.dart';

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
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 24, 24, 24),
        child: Card(
          color: Colors.black,
          shadowColor: Colors.black26,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 500,  
              width: 300,
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 7,),
                  const FlutterLogo(
                    size: 60.0,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 7,),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15,),
                    child: Divider(color: Colors.greenAccent,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 16,),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ContadorPage()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.transparent),
                    ), 
                    child: const Text(
                      'Contador de pessoas em estabelecimento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 49, 207, 49),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}