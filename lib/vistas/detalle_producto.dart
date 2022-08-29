import 'package:flutter/material.dart';

import '../clases/productos.dart';

class DetalleProducto extends StatelessWidget {
  final String routeName = 'DetalleProducto';

  const DetalleProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Productos item =  ModalRoute.of(context)!.settings.arguments as Productos;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.nombre),

      ),
      body: Center(
        child: Text('Existen un total de ${item.cantidad} en el almacen, a un precio de ${item.precio} Bs. por unidad'),
      ),
    );
  }
}
