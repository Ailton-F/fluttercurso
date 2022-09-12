import 'package:flutter/material.dart';
import 'package:fluttercurso/contador.dart';

class CaroulItems {
  static Widget? ctCard;

  static final List<Widget> items = [
    // TENTANDO ADICIONAR COMPONENTES EM UMA LISTA
    // if (Widget) ctCard = ContadorCard.contadorCard else ;
  ];
  
}

abstract class ContadorCard extends StatelessWidget {
  const ContadorCard({super.key});
  static final Widget? contadorCard;

  @override
  Widget build(BuildContext context) {
    Widget contadorCard = Card(
      color: Colors.black,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: 500,
          width: 300,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              const FlutterLogo(
                size: 60.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Divider(
                  color: Colors.greenAccent,
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
