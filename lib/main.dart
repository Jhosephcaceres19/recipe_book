import 'package:flutter/material.dart';
// Asegúrate de que esta ruta sea correcta en tu proyecto
import 'package:project_restaurant/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Se añade 'const' aquí para mejor rendimiento
      debugShowCheckedModeBanner: false,
      title: "Hola mundo",
      home: RecibeBook(),
    );
  }
}

class RecibeBook extends StatelessWidget {
  const RecibeBook({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Envolver en DefaultTabController y definir la cantidad de pestañas
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text(
            "Recipe Book",
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            // Cambiado a color blanco para que los iconos/textos se vean sobre el naranja
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromRGBO(193, 196, 190, 0.984),
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.favorite), text: "Me gusta"),
            ],
          ),
        ),
        body: TabBarView(children: [HomeScreen()]),
      ),
    );
  }
}
