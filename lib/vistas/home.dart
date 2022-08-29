import 'package:flutter/material.dart';
import 'package:itecursoflutter/datos/datos.dart';
import 'package:itecursoflutter/vistas/detalle_producto.dart';
import 'package:itecursoflutter/vistas/nuevo_producto.dart';

class Home extends StatefulWidget {
  final String routeName = 'Home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, NuevoProducto().routeName);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: listaProductos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listaProductos[index].nombre),
            trailing: IconButton(
                onPressed: () => Navigator.pushNamed(
                    context, const DetalleProducto().routeName,
                    arguments: listaProductos[index]),
                icon: const Icon(Icons.arrow_forward_rounded)),
          );
        },
      ),
    );
  }
}
