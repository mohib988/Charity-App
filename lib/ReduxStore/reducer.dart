import 'package:flutter_application_1/ReduxStore/states.dart';
import 'package:flutter_application_1/models/org.dart';

import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      organization: organizationReducer(state.organization, action),
      organizationList: organizationListReducer(state.organizationList, action),
      isLoading: isLoadingReducer(state.isLoading, action));
}

OrganizationInfo organizationReducer(OrganizationInfo state, dynamic action) {
  if (action is SetOrganizationAction) {
    return action.organization;
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
