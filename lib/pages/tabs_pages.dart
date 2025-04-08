import 'package:clase_4_diplomado/pages/tab1_page.dart';
import 'package:clase_4_diplomado/pages/tab2_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/new_services.dart';

class TabsPages extends StatefulWidget {
  @override
  State<TabsPages> createState() => _TabsPagesState();
}

class _TabsPagesState extends State<TabsPages> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(body: _Paginas(), bottomNavigationBar: _Navegacion()),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    //final categoryChange = Provider.of<NewsServices>(context).getTopHeadlines;

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (index) async {
        navegacionModel.paginaActual = index;
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tab 1'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Tab 2'),
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
      children: [Tab1Page(), Tab2Pages()],
      //children: [Container(color: Colors.red), Container(color: Colors.green)],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  final PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;

  PageController get pageController => this._pageController;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    this._pageController.animateToPage(
      valor,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}
