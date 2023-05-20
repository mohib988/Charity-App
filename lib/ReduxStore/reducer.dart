import 'package:flutter_application_1/ReduxStore/states.dart';
import 'package:flutter_application_1/models/org.dart';

import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      currentOrganization:
          organizationReducer(state.currentOrganization, action),
      organizationList: organizationListReducer(state.organizationList, action),
      isLoading: isLoadingReducer(state.isLoading, action));
}

OrganizationInfo organizationReducer(OrganizationInfo state, dynamic action) {
  if (action is SetOrganizationAction) {
    return action.currentOrganization;
  }
  return state;
}

List<OrganizationInfo> organizationListReducer(
    List<OrganizationInfo> state, dynamic action) {
  if (action is SetOrganizationListAction) {
    return action.organizationList;
  }
  return state;
}

bool isLoadingReducer(bool state, dynamic action) {
  if (action is SetIsLoadingAction) {
    return action.isLoading;
  }
  return state;
}
