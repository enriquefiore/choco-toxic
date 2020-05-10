import 'package:chocotoxic/views/menu_view.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  static const String routeName = '/history';
  HistoryView({Key key}) : super(key: key);
  void _excludeFormItems() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choco Toxic - Histórico'),
      ),
      drawer: MenuView(),
      body: DataTable(
        columns: <DataColumn> [ 
          /* DataColumn(label: Text('Data/Hora')),
          DataColumn(label: Text('Tipo Chocolate')),
          DataColumn(label: Text('Quant. Chocolate')), */
          DataColumn(label: Text('Peso do Cão')),
          DataColumn(label: Text('Resultado')),
          DataColumn(label: Text('')),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
/*               DataCell(Text('10/05/2020')),
              DataCell(Text('Ao leite')),
              DataCell(Text('Student')), */
              DataCell(Text('Student')),
              DataCell(Text('Student')),
              DataCell(
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                )
              ),
            ],
          ),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _excludeFormItems,
        tooltip: 'Excluir seleção',
        child: Icon(Icons.delete),
        backgroundColor: Colors.red,
      ),
    );
  }
}