import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/features/books/repo.dart';
import '../../models/book.dart';

part 'events.dart';
part 'states.dart';

class BooksBloc extends Bloc<BooksEvents, BooksStates> {
  BooksBloc() : super(BooksInitialState()) {
    on<GetBooksEvent>(_getData);
    on<ChangeBookFavStatusEvent>(_changeStatus);
  }

  final repo = BooksRepoImp();

  Future refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    add(GetBooksEvent());
  }

  void _getData(
    GetBooksEvent event,
    Emitter<BooksStates> emit,
  ) async {
    emit(GetBooksLoadingState());
    var either = await repo.getBooks();
    either.fold(
      (l) => emit(
        GetBooksSuccessState(list: l),
      ),
      (r) => emit(
        GetBooksFailedState(msg: r.massage),
      ),
    );
  }

  void _changeStatus(
    ChangeBookFavStatusEvent event,
    Emitter<BooksStates> emit,
  ) async {
    emit(ChangeBookFavLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    event.model.changeFav();
    emit(ChangeBookFavSuccessState(
        msg: "Updated Successfully", index: event.index));
  }
}
