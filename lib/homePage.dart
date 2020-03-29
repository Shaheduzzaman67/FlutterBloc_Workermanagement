import 'package:flutter/material.dart';
import 'worker.dart';
import 'workerBloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WorkerBloc _workerBloc = WorkerBloc();


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
