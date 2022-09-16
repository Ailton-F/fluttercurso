// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'contador.dart';
import 'pokedex.dart';

class CaroulItems {
  static final List<Widget> items = [
    //ignore prefer_const_constructor
    ContadorCard(),
    CalculadoraCard()
  ];
}

class ContadorCard extends StatelessWidget {
  const ContadorCard({super.key});
  @override
  Widget build(BuildContext context) {
    Widget contadorCard = Card(
      color: Colors.black,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: 400,
          width: 300,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              const FlutterLogo(
                size: 60.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ContadorPage()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  foregroundColor:
                      MaterialStateProperty.all(Colors.transparent),
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
    );
    return contadorCard;
  }
}

class CalculadoraCard extends StatelessWidget {
  const CalculadoraCard({super.key});
  @override
  Widget build(BuildContext context) {
    Widget contadorCard = Card(
      color: Colors.black,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: 400,
          width: 300,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              const FlutterLogo(
                size: 60.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PokedexPage()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  foregroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text(
                  'Pokedex',
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
    );
    return contadorCard;
  }
}
