import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:chocotoxic/views/details_view.dart';
import 'package:chocotoxic/views/menu_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';
  HomeView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class Resultado{
  double resultado = 0;
  String ddChocolateValue = "Ao leite";
  String resultadoCalculadora = "";
  String resultadoMensagem = "";
  Color resultadoCor = Colors.grey[50];
  Color resultadoCorFonte = Colors.white;
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var pesoChoController = TextEditingController();
  var pesoDogController = TextEditingController();
  Resultado result = Resultado();

  void _resetForm() {
    setState(() {
      result = Resultado();
      pesoChoController.text = "";
      pesoDogController.text = "";
    });
  }

  BorderRadiusGeometry toggleBorder(){
    return result.resultadoMensagem != '' ? BorderRadius.only(
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10)
    ) : BorderRadius.zero;
  }

  BoxShadow toggleShadow(){
    return result.resultadoMensagem != '' ? BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3),
    ) : BoxShadow(color:Colors.grey[50]);
  }

  BoxShadow toggleBtnShadow(){
    return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 3,
      blurRadius: 10,
      offset: Offset(0, 3),
    );
  }

  FlatButton toggleSaibaMais(){
    return result.resultadoMensagem != '' ?  FlatButton(
      onPressed: () => Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (_) => DetailsView(input: result)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Saiba mais'),
          )
        ],
      )
    ) : null;
  }

  void calcular(){
    setState(() {
      FocusScope.of(context).requestFocus(FocusNode());
      double chocolate = double.tryParse(pesoChoController.text);
      double cachorro = double.tryParse(pesoDogController.text);
      double metilxantina = 0;
      
      switch(result.ddChocolateValue){
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
        var resultado = (metilxantina * chocolate) / cachorro;
        result.resultadoCalculadora = "${resultado.toStringAsFixed(2)} mg/kg";
        result.resultadoCor = resultado < 20 ? Colors.teal : resultado < 40 ? Colors.yellow : resultado < 60 ? Colors.orange : Colors.red;
        result.resultadoCorFonte = resultado < 20  || resultado >= 60 ? Colors.white : Colors.black;  
        result.resultadoMensagem = resultado < 20 ? 'Baixo risco' : resultado < 40 ? 'Médio risco' : resultado < 60 ? 'Alto risco' : 'Risco de morte';
        result.resultado = resultado;
      } else
        result.resultadoCalculadora = "";
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
                height: 60,
              ),
              Focus(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso do cão (kg)",
                      labelStyle: TextStyle(
                          color: Colors.brown,                          
                      )
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20.0,
                  ),
                  controller: pesoDogController,
                  validator: (value) {
                    if(value.isEmpty)
                      return "Insira o peso em kilogramas";
                  },
                ),
              ),
              Focus(
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      labelText: "Tipo de chocolate",
                      labelStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 20.0
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
                    color: Colors.brown,
                    fontSize: 20.0,
                  ),
                  onChanged: (String newValue){
                    setState((){
                      result.ddChocolateValue = newValue;
                    });
                  }
                ),
              ),
              Focus(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Quantidade de chocolate (g)",
                      labelStyle: TextStyle(
                          color: Colors.brown
                      )
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20.0,
                  ),
                  controller: pesoChoController,
                  validator: (value) {
                    if(value.isEmpty)
                      return "Insira o peso em gramas";
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [ toggleBtnShadow() ],
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.teal,
                    child: Text(
                      'CALCULAR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[50],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ), 
                    ),
                    onPressed: (){
                      calcular();
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: result.resultadoCor,
                  borderRadius: toggleBorder(),
                  boxShadow: [ toggleShadow() ],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      result.resultadoMensagem,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: result.resultadoCorFonte,
                          fontSize: 40.0
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      result.resultadoCalculadora,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: result.resultadoCorFonte,
                          fontSize: 20.0
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: toggleSaibaMais(),
              )
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetForm,
        autofocus: result.ddChocolateValue.contains('leite'),
        tooltip: 'Recomeçar',
        child: Transform(
          alignment: Alignment.center,
          child: Icon(Icons.refresh),
          transform: Matrix4.rotationY(math.pi),
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}