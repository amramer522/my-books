import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import '../../features/books/bloc.dart';
import '../items/item_book.dart';
import '../shimmers/books_shimmer.dart';

class BooksView extends StatelessWidget {
  BooksView({Key? key}) : super(key: key);

  final bloc = KiwiContainer().resolve<BooksBloc>()..add(GetBooksEvent());

  @override
  Widget build(BuildContext context) {
    debugPrint("build BooksView");
    return Scaffold(
        appBar: AppBar(
          title: const Text("مكتبة الكتب"),
        ),
        body: BlocBuilder(
          bloc: bloc,
          buildWhen: (previous, current) => (current is GetBooksLoadingState ||
              current is GetBooksSuccessState ||
              current is GetBooksFailedState),
          builder: (context, state) {
            if (state is GetBooksLoadingState) {
              return const BooksViewShimmer();
            } else if (state is GetBooksFailedState) {
              return Center(child: Text(state.msg));
            } else if (state is GetBooksSuccessState) {
              return RefreshIndicator(
                onRefresh: bloc.refresh,
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 195 / 300,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => ItemBook(
                      index: index, model: state.list[index], bloc: bloc),
                  itemCount: state.list.length,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
