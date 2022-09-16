import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Pokedex(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  Future<Map> _getVersions() async {
    http.Response res;
    res = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/version-group?offset=0&limit=24'));
    return json.decode(res.body);
  }

  @override
  void initState() {
    super.initState();

    _getVersions().then((map) {
      map['results'].forEach((i) {
        print(i['name']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     extendBodyBehindAppBar: true,
  //     backgroundColor: const Color.fromARGB(255, 12, 9, 9),
  //     appBar: AppBar(
  //       leading: IconButton(
  //         onPressed: () {},
  //         icon: const Icon(Icons.arrow_back),
  //       ),
  //       backgroundColor: Colors.transparent,
  //       elevation: 0.0,
  //     ),
  //   );
  // }
}
