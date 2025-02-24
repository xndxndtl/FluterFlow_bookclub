import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/d_book_club/d_c_debate/d_de_club_debate_form/d_de_club_debate_form_widget.dart';
import 'dart:ui';
import 'd_de_club_debate_widget.dart' show DDeClubDebateWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DDeClubDebateModel extends FlutterFlowModel<DDeClubDebateWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DDe_Club_Debate_Form component.
  late DDeClubDebateFormModel dDeClubDebateFormModel;

  @override
  void initState(BuildContext context) {
    dDeClubDebateFormModel =
        createModel(context, () => DDeClubDebateFormModel());
  }

  @override
  void dispose() {
    dDeClubDebateFormModel.dispose();
  }
}
