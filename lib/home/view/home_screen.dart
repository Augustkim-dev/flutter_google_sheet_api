import 'package:flutter/material.dart';
import 'package:flutter_future_list_builder/repository/list_data_repository.dart';

class FutureBuilderExampleApp extends StatelessWidget {
  const FutureBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FutureBuilderExample(),
    );
  }
}

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  // final Future<String> _calculation = Future<String>.delayed(
  //   const Duration(seconds: 2),
  //   () => 'Data Loaded',
  // );

  // final check_calculation = ListDataRepository();
  final ListDataRepository check_calculation = ListDataRepository();

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<List<String>>(
        // future: _calculation, // a previously-obtained Future<String> or null
        future: check_calculation.test_ListData,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          // future에서 데이터 받아서 저장해두고
          final List<String>? dataLists = snapshot.data;

          // List<Widget> children;

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          }

          if (dataLists != null) {
            return ListView.builder(
              itemCount: dataLists.length,
              itemBuilder: (context, index) {
                final dataList = dataLists[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Text(dataList.toString()),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('no data found'),
            );
          }

          /*
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}', style: TextStyle(color: Colors.white)),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
          */
        },
      ),
    );
  }
}
