import 'package:av2/ui/page_home_list.dart';
import 'package:av2/ui/tela_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "segunda prova",
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade800),
      useMaterial3: true,
    ),
    home: const PageHomeList(),
  ));
}
