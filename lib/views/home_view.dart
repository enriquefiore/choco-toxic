import 'package:flutter/material.dart';
import 'package:chocotoxic/views/menu_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';
  HomeView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var pesoChoController = TextEditingController();
  var pesoDogController = TextEditingController();
  String ddChocolateValue = "Ao leite";
  String _resultadoCalculadora = "";
  String _resultadoMensagem = "";
  Color _resultadoCor = Colors.grey[50];
  Color _resultadoCorFonte = Colors.white;

  void _resetForm() {
    setState(() {
      ddChocolateValue = "Ao leite";
      pesoChoController.text = "";
      pesoDogController.text = "";
      _resultadoCalculadora = "";
      _resultadoMensagem = "";
      _resultadoCor = Colors.grey[50];
      _resultadoCorFonte = Colors.white;
    });
  }

  void calcular(){
    setState(() {
      double chocolate = double.tryParse(pesoChoController.text);
      double cachorro = double.tryParse(pesoDogController.text);
      double metilxantina = 0;
      double resultado = 0;

      switch(ddChocolateValue){
        case "Branco":
          metilxantina = 0.0035;
          break; 
        case "Ao leite":
          metilxantina = 2.2575;
          break;
        case "Achocolatado":
          metilxantina = 5.3264;
          break;
        case "Meio amargo":
          metilxantina = 5.6438;
          break;
        case "Amargo":
          metilxantina = 15.3442;
          break;
        case "Cacau em pó":
          metilxantina = 28.4661;
          break;
      }

      if(cachorro != null && chocolate != null) {
        resultado = (metilxantina * chocolate) / cachorro;
        resultado.toStringAsFixed(5);
        _resultadoCalculadora = "$resultado mg/kg";
        _resultadoCor = resultado < 20 ? Colors.teal : resultado < 40 ? Colors.yellow : resultado < 60 ? Colors.orange : Colors.red;
        _resultadoCorFonte = resultado < 20  || resultado >= 60 ? Colors.white : Colors.black;  
        _resultadoMensagem = resultado < 20 ? 'Baixo risco' : resultado < 40 ? 'Médio risco' : resultado < 60 ? 'Alto risco' : 'Risco de morte';
      } else
        _resultadoCalculadora = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MenuView(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Focus(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso do cão (kg)",
                      labelStyle: TextStyle(
                          color: Colors.teal
                      )
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  controller: pesoDogController,
                  validator: (value) {
                    if(value.isEmpty)
                      return "Insira o peso em kilogramas";
                    /* else
                      calcular(); */
                  },
                ),
                /* onFocusChange: (hasFocus){
                  if(!hasFocus)
                    calcular();
                }, */
              ),
              Focus(
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      labelText: "Tipo de chocolate",
                      labelStyle: TextStyle(
                          color: Colors.teal
                      )
                  ),
                  items: <String>['Ao leite','Meio amargo','Amargo','Achocolatado','Cacau em pó','Branco']
                  .map<DropdownMenuItem<String>>((String value1){
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(value1),
                    );
                  }).toList(),
                  style:TextStyle(
                    color: Colors.brown[900],
                    fontSize: 20.0,
                  ),
                  onChanged: (String newValue){
                    setState((){
                      ddChocolateValue = newValue;
                      /* calcular(); */
                    });
                  }
                ),
                /* onFocusChange: (hasFocus){
                  if(!hasFocus)
                    calcular();
                }, */
              ),
              Focus(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Quantidade de chocolate (g)",
                      labelStyle: TextStyle(
                          color: Colors.teal
                      )
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.brown[900],
                    fontSize: 20.0,
                  ),
                  controller: pesoChoController,
                  validator: (value) {
                    if(value.isEmpty)
                      return "Insira o peso em gramas";
                    /* else
                      calcular(); */
                  },
                ),
                /* onFocusChange: (hasFocus){
                  if(!hasFocus)
                    calcular();
                }, */
              ),
              SizedBox(
                height: 35,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.teal,
                child: Text(
                  'CALCULAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[50]
                  ), 
                ),
                onPressed: (){
                  calcular();
                },
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                color: _resultadoCor,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      _resultadoMensagem,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: _resultadoCorFonte,
                          fontSize: 40.0
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      _resultadoCalculadora,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: _resultadoCorFonte,
                          fontSize: 20.0
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetForm,
        autofocus: ddChocolateValue.contains('leite'),
        tooltip: 'Recomeçar',
        child: Icon(Icons.delete),
        backgroundColor: Colors.red,
      ),
    );
  }
}