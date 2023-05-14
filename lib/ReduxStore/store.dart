import 'package:flutter_application_1/ReduxStore/reducer.dart';
import 'package:flutter_application_1/ReduxStore/states.dart';
import 'package:redux/redux.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState.initialState(),
);
