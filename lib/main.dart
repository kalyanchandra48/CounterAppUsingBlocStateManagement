import 'package:counter_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementValue());
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementValue());
                },
                child: const Icon(Icons.remove),
              )
            ],
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                  height: 40,
                  width: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      '$state',
                      style: const TextStyle(fontSize: 34),
                    ),
                  ),
                )
              ])),
        );
      },
    );
  }
}
