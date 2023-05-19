import "dart:io";

import "../models/org.dart";

class AppState {
  final OrganizationInfo organization;
  final List<OrganizationInfo> organizationList;

  final bool isLoading;
  AppState({
    required this.organization,
    required this.organizationList,
    required this.isLoading,
  });

  factory AppState.initialState() => AppState(
        organization: OrganizationInfo(image: File("")),
        organizationList: [],
        isLoading: false,
      );
}
