// ignore_for_file: non_constant_identifier_names

import 'package:flutter_application_1/models/org.dart';

class SetOrganizationAction {
  final OrganizationInfo currentOrganization;
  SetOrganizationAction(this.currentOrganization);
}

class SetOrganizationListAction {
  final List<OrganizationInfo> organizationList;
  SetOrganizationListAction(this.organizationList);
}

class SetIsLoadingAction {
  late final bool isLoading;
  SetIsLoadingAction(this.isLoading);
}
