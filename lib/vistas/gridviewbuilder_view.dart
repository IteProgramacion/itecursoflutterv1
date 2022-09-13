import 'package:flutter/material.dart';
import 'package:itecursoflutter/datos/datos.dart';
import 'package:itecursoflutter/indexs.dart';
import 'package:itecursoflutter/vistas/detalle_producto.dart';
import 'package:itecursoflutter/vistas/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

class GridViewBuilderView extends StatefulWidget {
  final String routeName = 'GridViewBuilderView';

  const GridViewBuilderView({Key? key}) : super(key: key);

  @override
  State<GridViewBuilderView> createState() => _GridViewBuilderViewState();
}

class _GridViewBuilderViewState extends State<GridViewBuilderView> {


  List<NavigationRailDestination> categorias = List.generate(
      10,
      (index) => NavigationRailDestination(
          icon: Icon(listCategoiaIcon[index]), label: Text('cat $index')));

  @override
  Widget build(BuildContext context) {
    print('****************************: ${listaProductos.length}');
    final selectIndex = Provider.of<Indexs>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matriz Builder'),
      ),
      drawer: const MenuWidget(),
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                controller: ScrollController(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      destinations: categorias,
                      selectedIndex: selectIndex.indexRailNavigation,
                      labelType: NavigationRailLabelType.all,
                      onDestinationSelected: (int value) {
                        setState(() {
                          selectIndex.indexRailNavigation = value;
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          Flexible(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(
                debugLabel: 'asdasd',
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: listaProductos.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black26),
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, const DetalleProducto().routeName,
                                arguments: listaProductos[index]);
                          },
                          icon: const Icon(Icons.add_a_photo_rounded)),
                      Text(listaProductos[index].nombre),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
