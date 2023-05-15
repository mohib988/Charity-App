import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/drawer.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/org_card.dart';
import 'package:flutter_application_1/pages/org_signup_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:flutter_application_1/pages/splash.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'AppTheme/app_theme.dart';
import 'ReduxStore/reducer.dart';
import 'ReduxStore/states.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({super.key, required this.store});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        home: OrganizationGrid()
        // routes: {
        //   "/login": (context) => LoginPage(),
        //   "/signup": (context) => SignupPage(),
        //   "/org": (context) => OrganizationSignupPage(),
        // },
        );
  }
}

// chaging your comment to check if fork and git push pull works 

//Another comment


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home '),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Text("this is text"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(
//             shadows: [Shadow(color: Colors.white)],
//             Icons.ad_units_outlined,
//             weight: Checkbox.width,
//             color: Colors.amber),
//       ),
//       bottomNavigationBar: Text("this is ist"),
//       extendBody:true,
        
//       , // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
