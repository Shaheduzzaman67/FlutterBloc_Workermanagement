import 'dart:async';
import 'worker.dart';

class WorkerBloc{
  List<Worker> _workerList = [
    Worker(1, "Shishir", 500),
    Worker(2, "Tushar", 1200),
  ];

  final _workerListStreamController = StreamController<List<Worker>>();
  final _wokerSalaryIncrement = StreamController<Worker>();
  final _wokerSalaryDecrement = StreamController<Worker>();

  Stream<List<Worker>> get  workerListStream => _workerListStreamController.stream;

  StreamSink<List<Worker>>  get workerListSink => _workerListStreamController.sink;

  StreamSink<Worker> get workerSalaryIncrement => _wokerSalaryIncrement.sink;

  StreamSink<Worker> get workerSalaryDecrement => _wokerSalaryDecrement.sink;

  WorkerBloc(){
    _workerListStreamController.add(_workerList);
    _wokerSalaryIncrement.stream.listen(_incriment);
    _wokerSalaryDecrement.stream.listen(_decrement);
  }
  _incriment(Worker worker){
    double salary = worker.salary;
    double incrementSalary = salary * 50/100;
    _workerList[worker.id -1].salary = salary+ incrementSalary;
    workerListSink.add(_workerList);
  }
  _decrement(Worker worker){
    double salary = worker.salary;
    double decrementSalary = salary * 50/100;
    _workerList[worker.id -1].salary = salary- decrementSalary;
    workerListSink.add(_workerList);
  }

  void dispose(){
    _wokerSalaryIncrement.close();
    _wokerSalaryDecrement.close();
    _workerListStreamController.close();
  }
}