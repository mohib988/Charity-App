import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/OrganizationProfilePage/org_profile_page.dart';
import 'package:flutter_application_1/pages/login/login.dart';
import 'package:flutter_application_1/pages/homepage/org_card.dart';
import 'package:flutter_application_1/pages/signups/org_signup_page.dart';
import 'package:flutter_application_1/pages/signups/signup_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'AppTheme/app_theme.dart';
import 'ReduxStore/reducer.dart';
import 'ReduxStore/states.dart';
import 'pages/splash/splash.dart';

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
            home: Splash(),
            routes: {
              "/login": (context) => LoginPage(),
              "/signup": (context) => SignupPage(),
              "/orgSignup": (context) => OrganizationSignupPage(),
              "/home": (context) => OrganizationGrid(),
              "/profile": (context) => OrganizationProfile(),
            }));
  }
}


            // home: UserProfilePage(
            //   userName: 'Usman Khalid',
            //   donations: [
            //     Donation(title: 'Clothes', dateTime: '2023-05-15 10:00 AM'),
            //     Donation(title: 'Money', dateTime: '2023-05-16 02:30 PM'),
            //     Donation(title: 'Food', dateTime: '2023-05-17 09:45 AM'),
            //     Donation(title: 'Clothes', dateTime: '2023-05-17 09:45 AM'),
            //     Donation(title: 'Money', dateTime: '2023-05-18 01:00 PM'),
            //   ],
            // ),