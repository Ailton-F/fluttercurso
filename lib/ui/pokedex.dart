import 'dart:convert';
import 'package:flutter/material.dart';
import '../extensions.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Pokedex(),
      theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.white),
          errorColor: Colors.red),
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
  //Controlador para o filtro
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String? _search;
  int _currentMax = 6;
  int _offset = 0;

  //Retorna todos os pokemon
  Future<Map> _getAllPokemons({int offset = 0, int limit = 1154}) async {
    http.Response res;

    res = await http.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit'));

    return json.decode(res.body);
  }

  //Retorna todas as versões dos jogos de pokemon
  Future<Map> _getVersions() async {
    http.Response res;

    res = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/version-group?offset=0&limit=24'));
    return json.decode(res.body);
  }

  //Retorna um pokémon específico
  Future<Map> _getPokemon(String? poke) async {
    http.Response res;
    res = await http.get(Uri.parse('​https://pokeapi.co/api/v2/pokemon/ditto'));
    print(res);
    return json.decode(res.body);
  }

  _getMoreContent() {
    _getAllPokemons(offset: _currentMax, limit: _currentMax + 6);
    _offset = _currentMax;
    _currentMax += 6;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (_search == null) {
      Future<Map<dynamic, dynamic>> pokemon =
          _getAllPokemons(offset: 0, limit: 6);
      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _getMoreContent();
        }
      });
    }
  }

  //Retorna a listView dos pokemons
  Widget _createPokemonView(BuildContext context, AsyncSnapshot snapshot) {
    if(_search != null) return Text(snapshot.data);
    
    if (snapshot.connectionState == ConnectionState.waiting && _offset == 0) {
      return Container(
        alignment: Alignment.center,
        child: const LinearProgressIndicator(),
      );
    }

    int contentLenght = snapshot.data['results'].length;
    return ListView.builder(
      controller: _scrollController,
      itemCount: contentLenght,
      itemBuilder: (context, index) {
        List<String> urlSplited =
            snapshot.data['results'][index]['url'].split('/');
        String pokeId = urlSplited[6];
        String name = snapshot.data['results'][index]['name'];
        String nameStr = name.replaceAll(RegExp(r'-'), ' ').toCapitalized();

        return GestureDetector(
            child: Row(
          children: [
            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokeId.png',
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png');
              },
              loadingBuilder: (context, error, stackTrace) {
                if (stackTrace == null) return error;
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              nameStr,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future pokemon;
    if (_search != null)
      pokemon = _getPokemon(_search);
    else
      pokemon = _getAllPokemons(offset: 0, limit: _currentMax);

    FutureBuilder futureBuilder = FutureBuilder(
        // future: _getAllPokemons(offset: 0, limit: _currentMax),
        future: pokemon,
        builder: (context, snapshot) {
          if (!snapshot.hasError) return _createPokemonView(context, snapshot);
          return Container();
        });

    return Scaffold(
      // const Color.fromARGB(255, 12, 9, 9)
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 12, 9, 9),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 32),
        child: Column(children: <Widget>[
          TextField(
            onSubmitted: (text) {
              setState(() {
                _search = text;
              });
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.all(MediaQuery.of(context).size.height / 50),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              border: const OutlineInputBorder(),
              labelText: 'search',
              labelStyle: const TextStyle(color: Colors.white),
              suffix: IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Expanded(child: futureBuilder)
        ]),
      ),
    );
  }
}
