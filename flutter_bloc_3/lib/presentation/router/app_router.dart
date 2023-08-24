import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_3/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_3/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_3/presentation/screens/second_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_3/presentation/screens/third_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                title: 'Home Screen', color: Colors.blueAccent));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                title: 'Second Screen', color: Colors.redAccent));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                title: 'Third Screen', color: Colors.greenAccent));
        break;
      default:
        return null;
    }
  }

  void dispose(){
    _counterCubit.close();
  }
}
