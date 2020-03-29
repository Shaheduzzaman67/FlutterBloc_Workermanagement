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
  void dispose(){
    _workerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Worker Management"),
      ),
      body: Container(
        child: StreamBuilder<List<Worker>>(
          stream: _workerBloc.workerListStream,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<List<Worker>> snapshot){
            return ListView.builder(
                itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                  return Card(
                    elevation:  5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "${snapshot.data[index].id}.",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${snapshot.data[index].name}.",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Text(
                                "${snapshot.data[index].salary}.",
                                style: TextStyle(fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
              },
            );
          } ,
        ),
      ),
    );
  }
}
