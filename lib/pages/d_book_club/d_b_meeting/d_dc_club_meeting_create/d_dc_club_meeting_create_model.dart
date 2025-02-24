import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/d_book_club/d_b_meeting/d_dc_club_meeting_create_form/d_dc_club_meeting_create_form_widget.dart';
import 'dart:ui';
import 'd_dc_club_meeting_create_widget.dart' show DDcClubMeetingCreateWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DDcClubMeetingCreateModel
    extends FlutterFlowModel<DDcClubMeetingCreateWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DDc_Club_Meeting_Create_Form component.
  late DDcClubMeetingCreateFormModel dDcClubMeetingCreateFormModel;

  @override
  void initState(BuildContext context) {
    dDcClubMeetingCreateFormModel =
        createModel(context, () => DDcClubMeetingCreateFormModel());
  }

  @override
  void dispose() {
    dDcClubMeetingCreateFormModel.dispose();
  }
}
