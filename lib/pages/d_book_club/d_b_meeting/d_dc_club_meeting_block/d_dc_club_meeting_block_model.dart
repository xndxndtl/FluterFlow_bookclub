import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'd_dc_club_meeting_block_widget.dart' show DDcClubMeetingBlockWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DDcClubMeetingBlockModel
    extends FlutterFlowModel<DDcClubMeetingBlockWidget> {
  ///  Local state fields for this component.

  MeetingRecord? joinOnOFF;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch1 widget.
  bool? switch1Value;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DebatesRecord? createdDebate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
