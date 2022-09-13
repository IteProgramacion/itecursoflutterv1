import 'package:flutter/material.dart';
import 'package:itecursoflutter/indexs.dart';
import 'package:itecursoflutter/vistas/detalle_producto.dart';
import 'package:itecursoflutter/vistas/gridviewbuilder_view.dart';
import 'package:itecursoflutter/vistas/home.dart';
import 'package:itecursoflutter/vistas/nuevo_producto.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Indexs(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        initialRoute: const Home().routeName,
        routes: {
          const Home().routeName : (BuildContext context)=> const Home(),
          NuevoProducto().routeName: (BuildContext context)=> NuevoProducto(),
          const DetalleProducto().routeName: (_)=> const DetalleProducto(),
          const GridViewBuilderView().routeName: (context) => const GridViewBuilderView()

        },

      ),
    );
  }
}
