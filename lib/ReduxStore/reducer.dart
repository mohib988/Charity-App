import 'package:flutter_application_1/ReduxStore/states.dart';
import 'package:flutter_application_1/models/org.dart';

import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    organization: organizationReducer(state.organization, action),
  );
}

OrganizationInfo organizationReducer(OrganizationInfo state, dynamic action) {
  if (action is SetOrganizationAction) {
    return action.organization;
  }
  return state;
}
