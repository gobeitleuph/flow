import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Essensplan'),
        actions: [
          IconButton(onPressed: _loginAdmin, icon: Icon(Icons.face_outlined)),
        ],
      ),
      body: SfCalendar(
        view: CalendarView.workWeek,
        timeSlotViewSettings: TimeSlotViewSettings(
            startHour: 11,
            endHour: 12,
            nonWorkingDays:  [
              DateTime.saturday,
              DateTime.sunday,
            ],
            timeInterval: Duration(minutes: 60),
            timeIntervalHeight: 200,
            timeFormat: '',
            dateFormat: 'd',
            dayFormat: 'EEEE',
            timeRulerSize: 0),
      ),
    );
  }
  void _loginAdmin() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AnsichtLogin())
    );
  }
}

class AnsichtLogin extends StatelessWidget{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sample App'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Admin Login',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Admin Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        //Navigator.push(
                        //context,
                        //MaterialPageRoute(builder: (context) => AnsichtAdmin()),
                        //);
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Student -->',
                          style: TextStyle(fontSize: 20),),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Essensplan einsehen',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //Navigator.push(
                            //  context,
                            //  MaterialPageRoute(builder: (context) => AnsichtStudent()),
                            //);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}
