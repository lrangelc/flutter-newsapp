import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (index) {
        print(index);
        print('navegacionModel.paginaActual');
        print(navegacionModel.paginaActual);
        navegacionModel.paginaActual = index;
        print(navegacionModel.paginaActual);
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text('Para Ti')),
        BottomNavigationBarItem(
            icon: Icon(Icons.public), title: Text('Encabezados'))
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController(initialPage: 0);

  int get paginaActual => _paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    this._pageController.animateToPage(this._paginaActual,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
