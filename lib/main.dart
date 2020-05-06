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

String ddChocolateValue = "Ao leite";

class _MyHomePageState extends State<MyHomePage> {
  double _txtCWeight = 0.0;
  double _txtAWeight = 0.0;

  void _resetForm() {
    setState(() {
      ddChocolateValue = "Ao leite";
      _txtCWeight = 0;
      _txtAWeight = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Tipo de chocolate: "),
                DropdownButton<String>(
                  value: ddChocolateValue,
                  icon: Icon(Icons.expand_more),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: Colors.black
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.teal,
                  ),
                  onChanged: (String newValue){
                    setState((){
                      ddChocolateValue = newValue;
                    });
                  },
                  items: <String>['Ao leite','Meio amargo','Amargo','Branco']
                  .map<DropdownMenuItem<String>>((String value1){
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(value1),
                    );
                  })
                  .toList(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 150.0,
                  child: Text(
                    "Quantidade ingerida: ", 
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false
                    ),
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)
                      ),
                      border: InputBorder.none,
                      hintText: ''
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  child: Text(
                    "g", 
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 150.0,
                  child: Text(
                    "Peso do cão: ", 
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false
                    ),
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)
                      ),
                      border: InputBorder.none,
                      hintText: ''
                    ),
                    
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  child: Text(
                    "kg", 
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                
              ],
            ),
          ],
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
