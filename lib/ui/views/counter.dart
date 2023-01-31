import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../../features/counter/bloc.dart';

class CounterView extends StatefulWidget {
 const CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final bloc = KiwiContainer().resolve<CounterBloc>();

  @override
  Widget build(BuildContext context) {
    debugPrint("print build");
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: "f1",
                mini: true,
                onPressed: () {
                  bloc.add(CounterPlusEvent());
                },
                child: const Icon(Icons.add)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  debugPrint("print BlocBuilder");
                  return Text("Counter : ${bloc.count}");
                },
              ),
            ),
            FloatingActionButton(
              heroTag: "f2",
                mini: true,
                onPressed: () {
                  bloc.add(CounterMinusEvent());
                },
                child: const Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}
