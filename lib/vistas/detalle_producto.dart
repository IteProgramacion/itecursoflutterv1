import 'package:flutter/material.dart';

import '../modelos/productos.dart';

class DetalleProducto extends StatefulWidget {
  final String routeName = 'DetalleProducto';

  DetalleProducto({Key? key}) : super(key: key);

  @override
  State<DetalleProducto> createState() => _DetalleProductoState();
}

class _DetalleProductoState extends State<DetalleProducto> {


  TextEditingController cantidad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Productos item =  ModalRoute.of(context)!.settings.arguments as Productos;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.nombre),

      ),
      body: Column(
        children: [
          Center(
            child: Text('Existen un total de ${item.cantidad} en el almacen, a un precio de ${item.precio} Bs. por unidad'),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: TextField(
              controller: cantidad,
              decoration: const InputDecoration(
                labelText: 'Cantidad',
              ),
            ),
          ),

          ElevatedButton(
            onPressed: (){
              item.cantidad=int.parse(cantidad.text);
              setState(() {

              });
            },
            child: const Text('actualize')
          )
        ],
      ),
    );
  }
}
