import 'package:flutter/material.dart';
import 'package:itecursoflutter/datos/datos.dart';
import 'package:itecursoflutter/vistas/detalle_producto.dart';
import 'package:itecursoflutter/vistas/nuevo_producto.dart';
import 'package:itecursoflutter/vistas/widgets/menu_widget.dart';

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
      drawer: const MenuWidget(),
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
            subtitle: Text('Inventario: ${listaProductos[index].cantidad} ::: Precio Unitario \$Bs${listaProductos[index].precio}'),
            trailing: IconButton(
                onPressed: () async{
                  await Navigator.pushNamed(
                    context, DetalleProducto().routeName,
                    arguments: listaProductos[index]
                  );

                  setState(() {

                  });
                },
                icon: const Icon(Icons.arrow_forward_rounded)),
          );
        },
      ),
    );
  }
}
