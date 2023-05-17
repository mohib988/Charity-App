import "dart:io";

import "../models/org.dart";

class AppState {
  final OrganizationInfo organization;
  final List<OrganizationInfo> organizationList;

  AppState({
    required this.organization,
    required this.organizationList,
  });

  factory AppState.initialState() => AppState(
        organization: OrganizationInfo(image: File("")),
        organizationList: [],
      );
}
