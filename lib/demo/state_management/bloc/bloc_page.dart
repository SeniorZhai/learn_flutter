import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_observer.dart';
import './cubit/counter_cubit.dart';
import 'package:bloc/bloc.dart';
import './counter_view.dart';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    // create: (_) => CounterCubit(),
    // child: CounterView(),
    // );
    return CounterView();
  }
}
