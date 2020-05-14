import 'package:flutter/material.dart';
import 'package:chocotoxic/views/menu_view.dart';

class DetailsView extends StatelessWidget {
  DetailsView({Key key, this.resultado}) : super(key: key);
  static const String routeName = '/details';
  final String resultado;
  
  String _defineCorResultado(){
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Recomendações'),
        ),
      drawer: MenuView(),
      body: Center(
        child: Text(
          "Recomendações: ${_defineCorResultado()}\n Trazer dados do resuldado em mg/kg e acertar as recomendações de acordo com o range da toxicidade", 
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Recomeçar',
        child: Icon(Icons.keyboard_arrow_left),
        backgroundColor: Colors.brown,
      ),
    );
  }
}