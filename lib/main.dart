import 'package:flutter/material.dart';
import 'api/authentication.dart';
import 'customer/user.dart';

void main() {
  runApp(GeneralApp());
}

class GeneralApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Authentication auth = Authentication();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: auth.login('mfk17@live.com', 'password'),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return Center();
        },
      ),
    );
  }
}
