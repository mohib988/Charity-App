import "dart:io";

import "../models/org.dart";

class AppState {
  final OrganizationInfo currentOrganization;
  final List<OrganizationInfo> organizationList;

  final bool isLoading;
  AppState({
    required this.currentOrganization,
    required this.organizationList,
    required this.isLoading,
  });

  factory AppState.initialState() => AppState(
        currentOrganization: OrganizationInfo(image: File("")),
        organizationList: [],
        isLoading: false,
      );
}
