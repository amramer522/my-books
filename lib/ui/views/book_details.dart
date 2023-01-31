import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/features/books/bloc.dart';

import '../../models/book.dart';

class BookDetailsView extends StatefulWidget {
  final BooksBloc bloc;
  final int index;
  final Book model;

  const BookDetailsView({Key? key, required this.bloc, required this.index, required this.model})
      : super(key: key);

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  late Book model;
  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل الكتاب"),
        actions: [
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
                      widget.bloc.add(ChangeBookFavStatusEvent(index: widget.index,model: model));
                    }
                  },
                  icon: Icon(
                    model.isFav ? Icons.favorite : Icons.favorite_border,
                    color: model.isFav ? Colors.red : Colors.grey,
                  ),
                );
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Hero(
                tag: "image${model.id}",
                child: Image.network(
                  model.image,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              child: Text(
                model.description,
                textAlign: TextAlign.end,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
