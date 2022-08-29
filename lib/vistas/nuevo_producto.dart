import 'package:flutter/material.dart';
import 'package:itecursoflutter/clases/productos.dart';
import 'package:itecursoflutter/datos/datos.dart';

class NuevoProducto extends StatelessWidget {

  final String routeName = 'NuevoProducto';

  NuevoProducto({Key? key}) : super(key: key);

  final TextEditingController nombre = TextEditingController();
  final TextEditingController cantidad = TextEditingController();
  final TextEditingController precio = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Producto'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                child: TextField(
                  controller: nombre,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                child: TextField(
                  controller: cantidad,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                child: TextField(
                  controller: precio,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  listaProductos.add(Productos(nombre: nombre.text, cantidad: int.parse(cantidad.text), precio: double.parse(precio.text)));
                  Navigator.pop(context);
                },
                child: const Text('agregar')
              )
            ],
          ),
        ),
      ),
    );
  }
}
