import 'package:flutter/material.dart';
import 'package:itecursoflutter/clases/productos.dart';

class NuevoProducto extends StatelessWidget {
  const NuevoProducto({Key? key}) : super(key: key);

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
                child: const TextField(),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                child: const TextField(),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                child: const TextField(),
              ),
              ElevatedButton(
                onPressed: () {
                  final item = Productos(nombre: 'item', cantidad: 5, precio: 6);
                  Navigator.pop(context, item);
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
