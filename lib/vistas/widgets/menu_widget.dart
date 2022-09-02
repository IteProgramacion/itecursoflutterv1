import 'package:flutter/material.dart';
import 'package:itecursoflutter/vistas/gridviewbuilder_view.dart';
import 'package:itecursoflutter/vistas/home.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              child: Center(
            child: Text('Menu'),
          )),
          Flexible(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Home'),
                  trailing: IconButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, const Home().routeName),
                      icon: const Icon(Icons.arrow_right_alt)),
                ),
                ListTile(
                  title: const Text('GridViewBuilder View'),
                  trailing: IconButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, const GridViewBuilderView().routeName),
                      icon: const Icon(Icons.arrow_right_alt),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
