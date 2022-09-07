import 'package:flutter/material.dart';
import 'package:itecursoflutter/datos/datos.dart';
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

  List<NavigationRailDestination> categorias = List.generate(
      10,
      (index) => NavigationRailDestination(

          icon: Icon(listCategoiaIcon[index]), label: Text('cat $index')));

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
                      labelType: NavigationRailLabelType.all,
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
                    image: const DecorationImage(fit: BoxFit.cover,
                      image: NetworkImage('https://dubaitrippackages.files.wordpress.com/2017/11/2-imgdinosaurs_base.jpg'),
                    ),
                    border: Border.all(width: 2, color: Colors.black26),
                      color: Colors.black12,
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
