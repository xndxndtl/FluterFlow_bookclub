import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  final _upcomingEventManager = StreamRequestManager<List<MeetingRecord>>();
  Stream<List<MeetingRecord>> upcomingEvent({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MeetingRecord>> Function() requestFn,
  }) =>
      _upcomingEventManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUpcomingEventCache() => _upcomingEventManager.clear();
  void clearUpcomingEventCacheKey(String? uniqueKey) =>
      _upcomingEventManager.clearRequest(uniqueKey);
}
