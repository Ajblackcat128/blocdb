import 'package:classico/assign_15/Homepage.dart';
import 'package:classico/assign_15/blocdbhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:classico/assign_15/db_helper.dart';




void main() {
  final dbHelper = DBHelper.getInstance();
  runApp(
    BlocProvider(
      create: (context) => NoteBloc(dbHelper),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Notes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}




