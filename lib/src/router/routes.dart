import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_poc/main.dart';
import 'package:go_router_poc/src/router/error_page.dart';
import 'package:go_router_poc/src/sample_feature/sample_item_details_view.dart';
import 'package:go_router_poc/src/sample_feature/sample_item_list_view.dart';
import 'package:go_router_poc/src/settings/settings_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const SampleItemListView(),
      ),
      routes: [
        GoRoute(
          name: 'details',
          path: 'details/:detailsId',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: SampleItemDetailsView(
              detailsId: state.params['detailsId'] ?? '0',
            ),
          ),
        ),
        GoRoute(
          name: 'settings',
          path: 'settings',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: SettingsView(
              controller: settingsController,
            ),
          ),
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage<void>(
    key: state.pageKey,
    child: ErrorPage(
      error: state.error,
    ),
  ),
);
