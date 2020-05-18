import 'package:flutter/material.dart';
import 'package:chocotoxic/views/menu_view.dart';
import 'package:chocotoxic/views/home_view.dart';

class Detalhe{
  String titulo;
  String motivo;
  String possiveisSintomas;
  String recomendacaoTutor;
  String recomendacaoVeterinario;
}

class DetailsView extends StatelessWidget {
  DetailsView({Key key, this.input}) : super(key: key);
  static const String routeName = '/details';
  final Resultado input;

  Detalhe detalhe = Detalhe();
 
  void _defineResultado(){
    if(input.resultado < 20){
        detalhe.possiveisSintomas = 'Nenhum';
        detalhe.recomendacaoTutor = 'Informar ao veterinário, retirar o restante de chocolate do alcance do animal, observar.';
        detalhe.recomendacaoVeterinario = 'Muito provável que nenhum tratamento seja necessário';
    }else if(input.resultado < 40){
        detalhe.possiveisSintomas = 'Vômito, diarréia, polidipsia e hiperatividade';
        detalhe.recomendacaoTutor = 'Sinais de intoxição por chocolate podem levar de 4 a 24 h para se manifestarem. Informar ao veterinário, observe o animal atentamente e retire o restante de chocolate do alcance. Caso haja um persistência dos sintomas, busque atendimento veterinário.';
        detalhe.recomendacaoVeterinario = 'Caso o animal ainda não esteja apresentando sintomas até 2 h após a ingestão, é recomendada a indução ao vômito com peroxido de hidrogênio, ou apomorfina. Tratamento sintomático, visando estabilizar o quadro emético e diarréico. Fluidoterapia auxilia na excreção das toxinas.';
    }else if(input.resultado < 60){
        detalhe.possiveisSintomas = 'Vômito, diarréia, polidipsia, hiperatividade, taquicardia e hipertensão.';
        detalhe.recomendacaoTutor = 'Sinais de intoxição por chocolate podem levar de 4 a 24 h para se manifestarem. Informar o quadro ao veterinário e se deslocar para atendimento assim que a ingestão for identificada.';
        detalhe.recomendacaoVeterinario = 'Caso o animal ainda não esteja apresentando sintomas até 2 h após a ingestão, é recomendada a indução ao vômito com peroxido de hidrogênio, ou apomorfina. Carvão ativado pode ajudar a reduzir a absorção das metilxantinas e deve ser oferecido a cada 3 h inicialmente, depois a cada 72 h, devido à recirculação entero-hepática. Catárticos salinos também podem ser indicados. Uma vez que o animal esteja apresentando sinais de intoxicação, tratamento sintomático deve ser instituído, visando estabilizar o quadro emético e diarréico. Fluidoterapia auxilia na excreção das toxinas, podendo ser indicada a sondagem urinaria desses pacientes para garantir uma eliminação continuada (cafeina pode ser reabsorvida na bexiga). As arritmias devem ser tratadas conforme a necessidade. Se ocorrer taquicardia, metoprolol é o beta bloqueador de eleição. Fármacos que impedem a eliminação de xantinas, como corticoides e eritromicina, deve ser evitados.';
    }else{
        detalhe.possiveisSintomas = 'a';
        detalhe.recomendacaoTutor = 'a';
        detalhe.recomendacaoVeterinario = 'a';
    }
  }

  TextStyle _defineTitleStyle(){
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 26
    );
  }

  TextStyle _defineDetailStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 16,
    );
  }

  BorderRadiusGeometry toggleBorder(){
    return input.resultadoMensagem != '' ? BorderRadius.only(
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10)
    ) : BorderRadius.zero;
  }

  BoxShadow toggleShadow(){
    return input.resultadoMensagem != '' ? BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3),
    ) : BoxShadow(color:Colors.grey[50]);
  }

  @override
  Widget build(BuildContext context) {
    _defineResultado();
    return new Scaffold(
      appBar: AppBar(
        title: Text('Recomendações'),
        ),
      drawer: MenuView(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:20),
            child: Container(
              decoration: BoxDecoration(
                color: input.resultadoCor,
                borderRadius: toggleBorder(),
                boxShadow: [ toggleShadow() ],
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    input.resultadoMensagem,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: input.resultadoCorFonte,
                        fontSize: 40.0
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'O paciente ingeriu ${input.resultado.toStringAsFixed(2)} mg/kg de metilxantinas (teobromina e cafeína).',
              style: _defineDetailStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'POSSÍVEIS SINTOMAS',
                  style: _defineTitleStyle(),
                ),
                Text(
                  detalhe.possiveisSintomas,
                  style: _defineDetailStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'TUTOR',
                  style: _defineTitleStyle(),
                ),
                Text(
                  detalhe.recomendacaoTutor,
                  style: _defineDetailStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'VETERINÁRIO',
                  style: _defineTitleStyle(),
                ),
                Text(
                  detalhe.recomendacaoVeterinario,
                  style: _defineDetailStyle(),
                ),
              ],
            ),
          ),
        ], 
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