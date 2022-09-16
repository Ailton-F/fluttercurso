// ignore: depend_on_referenced_packages
// import 'package:fluttercurso/contador.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'home_page_cards.dart';

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
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 24, 24, 24),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 550.0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
          ),
          items: CaroulItems.items.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(),
                  child: i,
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
