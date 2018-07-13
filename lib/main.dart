import 'package:flutter/material.dart';
import 'package:hlutter/user_list.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class MenuSection {
  MenuSection(this.title, this.icon);

  String title;
  IconData icon;

  var items = List<MenuItem>();
}

class MenuItem {
  MenuItem(this.title, this.icon);

  String title;
  IconData icon;
}

class _MyHomePageState extends State<MyHomePage> {
  var sections = List<MenuSection>();

  @override
  void initState() {
    super.initState();

    var s = MenuSection("title", Icons.access_alarms);
    s.items.add(MenuItem("人员", Icons.people));
    s.items.add(MenuItem("配方", Icons.book));
    s.items.add(MenuItem("产品", Icons.bookmark));
    sections.add(s);

    s = MenuSection("title", Icons.access_alarms);
    s.items.add(MenuItem("仓库", Icons.data_usage));
    s.items.add(MenuItem("采购", Icons.flag));
    s.items.add(MenuItem("基础数据", Icons.flag));
    sections.add(s);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // Observable.fromIterable(sections)
    // .flatMap((s) => Observable.fromIterable(s.items))
    // .toList()
    // .asObservable()
    var menus = List<MenuItem>();
    sections.forEach((s) => menus.addAll(s.items));

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      // body: ListView.builder(
      //     itemCount: sections.length,
      //     itemBuilder: (context, index) {
      //       var s = sections[index];
      //       return SizedBox(
      //         height: 64.0,
      //         width: 64.0,
      //         child: Column(
      //           children: <Widget>[
      //             ListTile(
      //               leading: Icon(s.icon),
      //               title: Text(s.title),
      //             ),
      //             GridView.builder(
      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 3),
      //               itemCount: s.items.length,
      //               itemBuilder: (context, index) {
      //                 var m = s.items[index];
      //                 return Text(m.title);
      //               },
      //             )
      //           ],
      //         ),
      //       );
      //     }),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: menus.length,
        itemBuilder: (context, index) {
          var m = menus[index];
          return InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(m.icon, size: 64.0, color: Color.fromARGB(128, 0, 0, 0),),
                Text(m.title, style: TextStyle(fontSize: 16.0, color: Color.fromARGB(156, 0, 0, 0)),),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserList()));
            },
          );
        },
      ),
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: () => {},
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
