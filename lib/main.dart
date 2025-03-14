import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            // Centrar el texto del título
            child: Text(
              'Miguel Dominguez',
              style: TextStyle(color: Colors.white), // Color del texto
            ),
          ),
          backgroundColor: Color(0xff145f95), // Color de fondo del AppBar
          leading: IconButton(
            // Leading: Ícono a la izquierda
            icon: Icon(Icons.menu, color: Colors.white), // Ícono de menú
            onPressed: () {
              // Acción al presionar el ícono
              print('Menú presionado');
            },
          ),
        ),
        body: ProveedoresList(),
      ),
    );
  }
}

class ProveedoresList extends StatelessWidget {
  // Mapa de datos de proveedores
  final Map<String, Map<String, String>> datos_proveedores = {
    '1': {
      'url_imagen':
          'https://raw.githubusercontent.com/Miguel-Dmz/imagenes_examen/refs/heads/main/60efbe9d4eaabad6613a97e798ebff87.jpg',
      'empresa': 'Nike', // Empresa de tenis
      'celular': '123-456-7890',
      'email': 'nike@example.com',
    },
    '2': {
      'url_imagen':
          'https://raw.githubusercontent.com/Miguel-Dmz/imagenes_examen/refs/heads/main/CHICHADIOS17.jpg',
      'empresa': 'Adidas', // Empresa de tenis
      'celular': '234-567-8901',
      'email': 'adidas@example.com',
    },
    '3': {
      'url_imagen':
          'https://raw.githubusercontent.com/Miguel-Dmz/imagenes_examen/refs/heads/main/images.jpg',
      'empresa': 'Puma', // Empresa de tenis
      'celular': '345-678-9012',
      'email': 'puma@example.com',
    },
    '4': {
      'url_imagen':
          'https://raw.githubusercontent.com/Miguel-Dmz/imagenes_examen/refs/heads/main/MESSI.jpg',
      'empresa': 'Reebok', // Empresa de tenis
      'celular': '456-789-0123',
      'email': 'reebok@example.com',
    },
    '5': {
      'url_imagen':
          'https://raw.githubusercontent.com/Miguel-Dmz/imagenes_examen/refs/heads/main/71310.png',
      'empresa': 'New Balance', // Empresa de tenis
      'celular': '567-890-1234',
      'email': 'newbalance@example.com',
    },
  };

  @override
  Widget build(BuildContext context) {
    // Convertir el mapa a una lista de proveedores
    final List<Map<String, String>> proveedores =
        datos_proveedores.values.toList();

    return Column(
      children: proveedores.map((proveedor) {
        return Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Color(0xff145f95), // Color de fondo
            borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // Sombra
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(proveedor['url_imagen']!), // Avatar desde URL
            ),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'id_proveedor: ${datos_proveedores.keys.toList()[proveedores.indexOf(proveedor)]} ', // Muestra el ID del proveedor
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              'Empresa: ${proveedor['empresa']}\n Celular: ${proveedor['celular']}\nEmail: ${proveedor['email']}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }
}
