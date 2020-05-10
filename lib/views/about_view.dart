import 'package:flutter/material.dart';
import 'package:chocotoxic/views/menu_view.dart';

class AboutView extends StatelessWidget {
  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Choco Toxic - Sobre'),
          ),
        drawer: MenuView(),
        body: Center(child: Text("About")));
  }
}