import 'package:flutter/material.dart';
import 'package:chocotoxic/routes/routes.dart';

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
        Navigator.pushReplacementNamed(ctx, Routes.history);
        break;
      case 2:
        Navigator.pushReplacementNamed(ctx, Routes.references);      
        break;
      case 3:
        Navigator.pushReplacementNamed(ctx, Routes.about);      
        break;
      default:
        Navigator.pushReplacementNamed(ctx, Routes.home);
        break;
    }
  }


    /* Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content: Text('$id Coca-cola'),
      ),
    ); */
}