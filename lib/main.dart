import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/core/kiwi.dart';
import 'package:my_books/core/logic/bloc_observer.dart';
import 'package:my_books/models/book.dart';
import 'package:my_books/res/colors.dart';

import 'ui/views/books.dart';
import 'ui/views/counter.dart';
import 'ui/views/family_logo.dart';

void main() {
  initKiwi();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      theme: ThemeData(
          primarySwatch: Colors.brown,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )),
      home: FamilyLogoView(),
    );
  }
}
