import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';

import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          _ListaCategorias(),
          Expanded(
              child: (newsService.getArticulosCategoriaSeleccionada.length == 0)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListaNoticias(
                      newsService.getArticulosCategoriaSeleccionada))
        ],
      ),
    ));
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    final newsService = Provider.of<NewsService>(context);

    return Container(
      width: double.infinity,
      height: 80.0,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final category = categories[index];
            final name =
                category.name[0].toUpperCase() + category.name.substring(1);
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _CategoryButton(category),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: (newsService.selectedCategory == category.name)
                            ? Colors.red
                            : Colors.white),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final name = category.name[0].toUpperCase() + category.name.substring(1);
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        print(name);
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (newsService.selectedCategory == category.name)
                ? Colors.red
                : Colors.white),
        child: Icon(
          category.icon,
          color: Colors.black54,
        ),
      ),
    );
    //  Icon(category.icon);
  }
}
