part of 'bloc.dart';

class BooksEvents  extends Equatable{
  @override
  List<Object?> get props => [];

}

class GetBooksEvent extends BooksEvents {}
class ChangeBookFavStatusEvent extends BooksEvents {
  final int index;
  final Book model;

  ChangeBookFavStatusEvent({required this.index,required this.model});
}
