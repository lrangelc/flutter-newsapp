import 'package:flutter/material.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(body: ListaNoticias(newsService.headlines),);
  }
}