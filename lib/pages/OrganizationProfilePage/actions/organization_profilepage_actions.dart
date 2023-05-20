import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../ReduxStore/states.dart';

loadProfile(BuildContext context) async {
  await Future.delayed(Duration(seconds: 2));
  final store = StoreProvider.of<AppState>(context);
  return store.state.currentOrganization;
}
