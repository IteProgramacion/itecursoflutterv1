import 'package:flutter/material.dart';

import '../clases/productos.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Productos> productos=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return Container(height: 110, width: 110, color: Colors.amber,);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index)=>const Divider(),
        itemCount: productos.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(productos[index].nombre),
          );
        },

      ),
    );
  }
}
