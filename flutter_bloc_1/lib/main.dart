import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/cubit/counter_cubit.dart';

// Strams
// Cubits
// bloc
//
// BlocProvider
// BlocBuilder
// BlocListener
// BlocConsumer
// RepositoryProvider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Incremented!'),
                duration: Duration(milliseconds: 300),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Decremented!'),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "You have pushed this button this many times.",
              ),

              // BlocConsumner =  BlocBuilder +  BlockListener

              // BlocConsumer<CounterCubit, CounterState>(
              //   listener: (context, state) {
              //     if (state.wasIncremented == true) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(
              //           content: Text('Incremented!'),
              //           duration: Duration(milliseconds: 300),
              //         ),
              //       );
              //     }else{
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(
              //           content: Text('Decremented!'),
              //           duration: Duration(milliseconds: 300),
              //         ),
              //       );
              //     }
              //   },
              //   builder: (context, state) {
              //     if (state.counterValue < 0) {
              //       return Text(
              //         'BRR, NEGATIVE ' + state.counterValue.toString(),
              //         style: Theme.of(context).textTheme.headline4,
              //       );
              //     } else if (state.counterValue % 2 == 0) {
              //       return Text(
              //         'YAAAY ' + state.counterValue.toString(),
              //         style: Theme.of(context).textTheme.headline4,
              //       );
              //     } else if (state.counterValue == 5) {
              //       return Text(
              //         'HMM, NUMBER 5',
              //         style: Theme.of(context).textTheme.headline4,
              //       );
              //     } else
              //       return Text(
              //         state.counterValue.toString(),
              //         style: Theme.of(context).textTheme.headline4,
              //       );
              //   },
              // ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (BuildContext context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'Negative :  ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Icon(Icons.remove),
                    tooltip: "Decrement",
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Icon(Icons.add),
                    tooltip: "Increment",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
