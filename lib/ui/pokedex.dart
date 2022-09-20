import 'dart:convert';
import 'package:flutter/material.dart';
import '../extensions.dart';
import 'package:http/http.dart' as http;

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Pokedex(),
      theme: ThemeData(hintColor: Colors.white),
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
  TextEditingController searchController = TextEditingController();

  //Retorna a url para o sprite dos pokemons
  Future _getPokemonsSprite(int pokeId) async {
    http.Response res;

    res = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokeId.png'));
    return res;
  }

  //Retorna todos os pokemon
  Future<Map> _getAllPokemons() async {
    http.Response res;
    res = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=0&limit=1154'));
    return json.decode(res.body);
  }

  //Retorna todas as versões dos jogos de pokemon
  Future<Map> _getVersions() async {
    http.Response res;
    res = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/version-group?offset=0&limit=24'));
    return json.decode(res.body);
  }

  //Retorna a listView dos pokemons
  Widget _createPokemonListView(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data['results'].length,
      itemBuilder: (context, index) {
        Image? pokeSprite;

        List<String> urlSplited =
            snapshot.data['results'][index]['url'].split('/');
        String pokeId = urlSplited[6];

        try {
          pokeSprite = Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokeId.png');
        } catch (e) {
          print('Caiu aqui');
          pokeSprite = Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png');
        }

        String name = snapshot.data['results'][index]['name'];
        String nameStr = name.replaceAll(RegExp(r'-'), ' ').toCapitalized();
        return GestureDetector(
            child: Row(
          children: [
            pokeSprite,
            Text(
              nameStr,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ));
      },
    );
  }

  // @override
  // void initState() {
  //   super.initState();

  //   _getAllPokemons().then((map) {
  //     print(map['results'].length);
  //     map['results'].forEach((i) {
  //       String name = i['name'];
  //       String nameStr = name.replaceAll(RegExp(r'-'), ' ').toCapitalized();
  //       // print(nameStr);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // const Color.fromARGB(255, 12, 9, 9)
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 12, 9, 9),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 64, 16, 32),
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
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
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: FutureBuilder(
                  future: _getAllPokemons(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          alignment: Alignment.center,
                          child: const LinearProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        );
                      default:
                        if (snapshot.hasError) {
                          return Container();
                        } else {
                          return _createPokemonListView(context, snapshot);
                        }
                    }
                  }))
        ]),
      ),
    );
  }
}
