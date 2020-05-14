import 'package:flutter/material.dart';
import 'package:chocotoxic/views/about_view.dart';
import 'package:chocotoxic/views/history_view.dart';
import 'package:chocotoxic/views/home_view.dart';
import 'package:chocotoxic/views/references_view.dart';

class MenuView extends StatelessWidget {
  MenuView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
            child: Text(
              'Choco Toxic',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pets),
            title: Text('Calculadora'),
            onTap: () {
              _getDrawerItem(context, 0);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Histórico'),
            onTap: () {
              _getDrawerItem(context, 1);
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Referências Bibliográficas'),
            onTap: () {
              _getDrawerItem(context, 2);
            },
          ),
          ListTile(
            leading: Icon(Icons.fingerprint),
            title: Text('Sobre'),
            onTap: () {
              _getDrawerItem(context, 3);
            },
          ),
        ],
      ),
    );
  }

  _getDrawerItem(BuildContext ctx, int id){
    switch(id){
      case 1:
        Navigator.push(ctx,MaterialPageRoute(builder: (_) => HistoryView()));
        break;
      case 2:
        Navigator.push(ctx,MaterialPageRoute(builder: (_) => ReferencesView()));    
        break;
      case 3:
        Navigator.push(ctx,MaterialPageRoute(builder: (_) => AboutView()));          
        break;
      default:
        Navigator.push(ctx,MaterialPageRoute(builder: (_) => HomeView(title: 'Choco Toxic')));
        break;
    }
  }
}