import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:falabella_challenge/providers/numbers_provider.dart';
import 'package:falabella_challenge/pages/welcome.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NumbersProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Falabella Challenge',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Welcome(),
      ),
    );
  }
}
