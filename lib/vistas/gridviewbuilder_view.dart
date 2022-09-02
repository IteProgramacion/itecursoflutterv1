import 'package:flutter/material.dart';
import 'package:itecursoflutter/vistas/widgets/menu_widget.dart';

class GridViewBuilderView extends StatefulWidget {
  final String routeName = 'GridViewBuilderView';

  const GridViewBuilderView({Key? key}) : super(key: key);

  @override
  State<GridViewBuilderView> createState() => _GridViewBuilderViewState();
}

class _GridViewBuilderViewState extends State<GridViewBuilderView> {
  List<Map> products =
      List.generate(100, (index) => {'id': index, 'name': 'Producto $index'})
          .toList();
  int selectIndex = 0;
  List<NavigationRailDestination> categoria = [
    const NavigationRailDestination(
        icon: Icon(Icons.print), label: Text('Prints')),
    const NavigationRailDestination(
        icon: Icon(Icons.fire_extinguisher), label: Text('Fire')),
    const NavigationRailDestination(
        icon: Icon(Icons.extension), label: Text('game')),
  ];
  List<NavigationRailDestination> categorias = List.generate(
      10,
      (index) => NavigationRailDestination(
          icon: const Icon(Icons.extension), label: Text('cat $index')));

  @override
  Widget build(BuildContext context) {
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
                  constraints: BoxConstraints(minHeight: constraints.maxHeight,),
                  child: IntrinsicHeight(
                    child: NavigationRail(

                      destinations: categorias,
                      selectedIndex: selectIndex,
                      onDestinationSelected: (int value) {
                        setState(() {
                          selectIndex = value;
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
              controller: ScrollController(debugLabel: 'asdasd', ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(products[index]['name']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}