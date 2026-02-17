import 'package:flutter/material.dart';

void main() {
  runApp(const BarbasLocasApp());
}

class BarbasLocasApp extends StatelessWidget {
  const BarbasLocasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InicioBarberia(),
    );
  }
}

class InicioBarberia extends StatelessWidget {
  const InicioBarberia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'BarbasLocas Peluca',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            // Buscador
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar barbero',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Lista de barberos
            const BarberoCard(nombre: 'Carlos'),
            const BarberoCard(nombre: 'Miguel'),
            const BarberoCard(nombre: 'Edgar'),
            const BarberoCard(nombre: 'Luis'),
          ],
        ),
      ),
    );
  }
}

class BarberoCard extends StatelessWidget {
  final String nombre;

  const BarberoCard({
    required this.nombre,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Nombre del barbero
          Row(
            children: <Widget>[
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              const SizedBox(width: 10),
              Text(
                nombre,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Cortes (imagenes falsas)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CorteBox(),
              CorteBox(),
              CorteBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class CorteBox extends StatelessWidget {
  const CorteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        'https://raw.githubusercontent.com/MOSESBOETAGARCIA/act10Boeta/refs/heads/main/images.jpg',
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Center(child: Icon(Icons.broken_image, color: Colors.grey));
        },
      ),
    );
  }
}