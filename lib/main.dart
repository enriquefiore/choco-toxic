import 'package:flutter/material.dart';
import 'package:chocotoxic/views/home_view.dart';
import 'package:chocotoxic/views/about_view.dart';
import 'package:chocotoxic/views/history_view.dart';
import 'package:chocotoxic/views/references_view.dart';

void main() => runApp(ChocoToxicApp());

class ChocoToxicApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choco Toxic',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(title: 'Choco Toxic'),
      routes: <String, WidgetBuilder> {
        '/history': (BuildContext context) => HistoryView(),
        '/references': (BuildContext context) => ReferencesView(),
        '/about': (BuildContext context) => AboutView(),
      }
    );
  }
}