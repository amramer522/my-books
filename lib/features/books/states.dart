part of 'bloc.dart';

class BooksStates {}

class BooksInitialState extends BooksStates {}

class GetBooksLoadingState extends BooksStates {}

class GetBooksSuccessState extends BooksStates {
  final List<Book> list;
  GetBooksSuccessState({required this.list});
}

class GetBooksFailedState extends BooksStates {
  String msg;
  GetBooksFailedState({required this.msg});
}

class ChangeBookFavLoadingState extends BooksStates {}

class ChangeBookFavSuccessState extends BooksStates {
  final String msg;
  final int index;
  ChangeBookFavSuccessState({required this.msg,required this.index});
}

class ChangeBookFavFailedState extends BooksStates {
  String msg;
  ChangeBookFavFailedState({required this.msg});
}
