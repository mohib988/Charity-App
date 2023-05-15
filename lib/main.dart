import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/OrganizationProfilePage/org_profile_page.dart';
import 'package:flutter_application_1/pages/drawer/drawer.dart';
import 'package:flutter_application_1/pages/login/login.dart';
import 'package:flutter_application_1/pages/homepage/org_card.dart';
import 'package:flutter_application_1/pages/signups/org_signup_page.dart';
import 'package:flutter_application_1/pages/signups/signup_page.dart';
import 'package:flutter_application_1/pages/splash/splash.dart';
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
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        home: CharityOrganizationProfile(
          imageUrl:
              "https://images.unsplash.com/photo-1624555130581-1d9cca783bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
          mission: "this is my mission",
          country: "Pakistan",
          address: "lorem erere  jkljklj ",
        ),
        routes: {
          "/login": (context) => LoginPage(),
          "/signup": (context) => SignupPage(),
          "/org": (context) => OrganizationSignupPage(),
        },
      ),
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
