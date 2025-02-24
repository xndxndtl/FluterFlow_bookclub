import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'd_bookclub_widget.dart' show DBookclubWidget;
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class DBookclubModel extends FlutterFlowModel<DBookclubWidget> {
  ///  Local state fields for this page.

  bool myClubView = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField_searchclub widget.
  FocusNode? textFieldSearchclubFocusNode;
  TextEditingController? textFieldSearchclubTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchclubTextControllerValidator;
  List<ClubsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSearchclubFocusNode?.dispose();
    textFieldSearchclubTextController?.dispose();
  }
}
