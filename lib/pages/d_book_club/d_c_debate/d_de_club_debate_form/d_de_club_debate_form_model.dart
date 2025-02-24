import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/d_book_club/d_c_debate/debate_contents_block/debate_contents_block_widget.dart';
import 'dart:ui';
import 'd_de_club_debate_form_widget.dart' show DDeClubDebateFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DDeClubDebateFormModel extends FlutterFlowModel<DDeClubDebateFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for addField widget.
  FocusNode? addFieldFocusNode;
  TextEditingController? addFieldTextController;
  String? Function(BuildContext, String?)? addFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addFieldFocusNode?.dispose();
    addFieldTextController?.dispose();
  }
}
