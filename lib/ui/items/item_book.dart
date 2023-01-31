import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/features/books/bloc.dart';
import '../../models/book.dart';
import '../views/book_details.dart';

class ItemBook extends StatefulWidget {
  final int index;
  final BooksBloc bloc;
  final Book model;

  const ItemBook(
      {Key? key, required this.bloc, required this.index, required this.model})
      : super(key: key);

  @override
  State<ItemBook> createState() => _ItemBookState();
}

class _ItemBookState extends State<ItemBook> {
  late Book model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build Item");
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsView(
                  index: widget.index, model: model, bloc: widget.bloc),
            ));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: "image${model.id}",
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      model.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  BlocBuilder(
                      bloc: widget.bloc,
                      buildWhen: (previous, current) =>
                          current is ChangeBookFavSuccessState &&
                          current.index == widget.index,
                      builder: (context, state) {
                        debugPrint("build Love Icon");
                        return IconButton(
                          onPressed: () {
                            if (state is! ChangeBookFavLoadingState) {
                              widget.bloc.add(ChangeBookFavStatusEvent(
                                  index: widget.index, model: model));
                            }
                          },
                          icon: Icon(
                            model.isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: model.isFav ? Colors.red : Colors.grey,
                          ),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
