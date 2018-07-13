import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'rest.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();

    RestApi
        .get("http://175.6.57.235:8081/api/data/orders")
        .then((r) => r["_embedded"]["orders"])
        .then((ml) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户"),
      ),
      body: ListView.builder(),
    );
  }
}
