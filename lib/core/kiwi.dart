import 'package:kiwi/kiwi.dart';
import 'package:my_books/features/books/bloc.dart';
import 'package:my_books/features/books/repo.dart';

import '../features/counter/bloc.dart';

void initKiwi() {

  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => BooksBloc());
  container.registerFactory((c) => CounterBloc());
}
