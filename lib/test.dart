import 'package:flutter/material.dart';
import 'package:labpract/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Flutter with Django',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Connect Flutter with Django'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Student studentService = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Faaaaaccko"),
        ),
        body: Container(
          child: FutureBuilder<List>(
            future: studentService.getAllStudent(),
            builder: (context, snapshot) {
              print(snapshot);
              print(snapshot.data![1]['user_name']);
              // print(snapshot.data.length);
              if (snapshot.hasData) {
                return Container(
                  height: 80,
                  child: new ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, i) {
                        return new Card(
                          child: ListTile(
                            leading: Text(snapshot.data![i]['user_name']),
                            title: Text(
                              snapshot.data![i]['email'],
                              style: TextStyle(fontSize: 30.0),
                            ),
                            subtitle: Text(
                              snapshot.data![i]['first_name'],
                              style: TextStyle(fontSize: 30.0),
                            ),
                            trailing: Text(
                              snapshot.data![i]['last_name'],
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return const Center(
                  child: Text('Noo Data Found'),
                );
              }
            },
          ),
        ));
  }
}
