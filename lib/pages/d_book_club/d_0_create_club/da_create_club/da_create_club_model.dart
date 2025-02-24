import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/d_book_club/d_0_create_club/da_create_club_form/da_create_club_form_widget.dart';
import 'dart:ui';
import 'da_create_club_widget.dart' show DaCreateClubWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DaCreateClubModel extends FlutterFlowModel<DaCreateClubWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Da_createClub_Form component.
  late DaCreateClubFormModel daCreateClubFormModel;

  @override
  void initState(BuildContext context) {
    daCreateClubFormModel = createModel(context, () => DaCreateClubFormModel());
  }

  @override
  void dispose() {
    daCreateClubFormModel.dispose();
  }
}
