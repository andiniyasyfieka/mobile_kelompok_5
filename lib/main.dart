import 'package:flutter/material.dart';
import 'package:karang_aqua_palette/splashscreen.dart';
// ignore: unused_import
import 'package:karang_aqua_palette/ticket.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Ticket(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
