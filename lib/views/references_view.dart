import 'package:flutter/material.dart';
import 'package:chocotoxic/views/menu_view.dart';

class ReferencesView extends StatelessWidget {
  static const String routeName = '/references';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Referências Bibliográficas'),
          ),
        drawer: MenuView(),
        body: Center(child: Text('Yadda, yadda, yadda')));
  }
}