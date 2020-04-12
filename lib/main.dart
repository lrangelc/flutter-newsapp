import 'package:flutter/material.dart';

import 'package:newsapp/src/pages/tabs_page.dart';
import 'package:newsapp/src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: miTema,
      home: TabsPage(),
    );
  }
}