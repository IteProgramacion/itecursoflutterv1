import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itecursoflutter/modelos/productos.dart';
import 'package:itecursoflutter/datos/datos.dart';

class NuevoProducto extends StatefulWidget {
  final String routeName = 'NuevoProducto';

  const NuevoProducto({Key? key}) : super(key: key);

  @override
  State<NuevoProducto> createState() => _NuevoProductoState();
}

class _NuevoProductoState extends State<NuevoProducto> {


  final TextEditingController nombre = TextEditingController();

  final TextEditingController cantidad = TextEditingController();

  final TextEditingController precio = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  XFile? image;

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
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(),
                  image: image != null ? DecorationImage(image: FileImage(File(image!.path,)), fit: BoxFit.cover): null,

                ),
                margin: const EdgeInsets.all(10),
                height: 200,

              ),

              ElevatedButton.icon(onPressed: () async {
                image = await _picker.pickImage(source: ImageSource.gallery);

                setState(() {

                });
              }, label: const Text('Foto'), icon: const Icon(Icons.add)),

              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre'
                  ),
                  controller: nombre,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: 'Cantidad'
                  ),
                  controller: cantidad,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: 'Nombre'
                  ),
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
