import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choco Toxic',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Choco Toxic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var pesoChoController = TextEditingController();
  var pesoDogController = TextEditingController();
  String ddChocolateValue = "Ao leite";
  String _resultadoCalculadora = "";
  String _resultadoMensagem = "";
  Color _resultadoCor = Colors.white;
  Color _resultadoCorFonte = Colors.white;

  void _resetForm() {
    setState(() {
      ddChocolateValue = "Ao leite";
      pesoChoController.text = "";
      pesoDogController.text = "";
      _resultadoCalculadora = "";
      _resultadoMensagem = "";
      _resultadoCor = Colors.white;
      _resultadoCorFonte = Colors.white;
    });
  }

  void calcular(){
    setState(() {
      double chocolate = double.parse(pesoChoController.text);
      double cachorro = double.parse(pesoDogController.text);
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

      if(!cachorro.isNaN && !chocolate.isNaN) {
        resultado = (metilxantina * chocolate) / cachorro;
        resultado.toStringAsFixed(5);
        _resultadoCalculadora = "$resultado mg/kg";
        _resultadoCor = resultado < 20 ? Colors.teal : resultado < 40 ? Colors.yellow : resultado < 60 ? Colors.orange : Colors.red;
        _resultadoCorFonte = resultado < 20  || resultado >= 60 ? Colors.white : Colors.grey;  
        _resultadoMensagem = resultado < 20 ? "Sem perigo." : resultado < 40 ? "Atenção!" : resultado < 60 ? "Perigo!" : "Risco de morte!";
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
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      labelText: "Tipo do chocolate",
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
                      calcular();
                    });
                  }
                ),
                onFocusChange: (hasFocus){
                  if(!hasFocus)
                    calcular();
                },
              ),
              Focus(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso do chocolate (g)",
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
                    else
                      calcular();
                  },
                ),
                onFocusChange: (hasFocus){
                  if(!hasFocus)
                    calcular();
                },
              ),
              Focus(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso do cachorro (kg)",
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
                    else
                      calcular();
                  },
                ),
                onFocusChange: (hasFocus){
                  if(!hasFocus)
                    calcular();
                },
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                color: _resultadoCor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      _resultadoMensagem,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: _resultadoCorFonte,
                          fontSize: 40.0
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: _resultadoCor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      _resultadoCalculadora,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: _resultadoCorFonte,
                          fontSize: 20.0
                      ),
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
        tooltip: 'Recomeçar',
        child: Icon(Icons.delete),
        backgroundColor: Colors.red,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}