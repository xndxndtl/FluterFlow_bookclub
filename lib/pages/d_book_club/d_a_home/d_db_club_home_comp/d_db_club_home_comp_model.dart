import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'd_db_club_home_comp_widget.dart' show DDbClubHomeCompWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DDbClubHomeCompModel extends FlutterFlowModel<DDbClubHomeCompWidget> {
  ///  Local state fields for this component.

  bool clubJoinRequest = true;

  /// Query cache managers for this widget.

  final _bookclubhomeManager = StreamRequestManager<ClubsRecord>();
  Stream<ClubsRecord> bookclubhome({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<ClubsRecord> Function() requestFn,
  }) =>
      _bookclubhomeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBookclubhomeCache() => _bookclubhomeManager.clear();
  void clearBookclubhomeCacheKey(String? uniqueKey) =>
      _bookclubhomeManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearBookclubhomeCache();
  }
}
