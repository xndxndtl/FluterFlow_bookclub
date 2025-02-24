import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'd_dc_club_meeting_edit_form_widget.dart'
    show DDcClubMeetingEditFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DDcClubMeetingEditFormModel
    extends FlutterFlowModel<DDcClubMeetingEditFormWidget> {
  ///  Local state fields for this component.

  bool imageOnOFF = false;

  String imageUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bookclub-75k2jc/assets/el2lb49qcv15/No_Image_Png.png';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_Title widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldTitleTextControllerValidator;
  // State field(s) for TextField_Author widget.
  FocusNode? textFieldAuthorFocusNode;
  TextEditingController? textFieldAuthorTextController;
  String? Function(BuildContext, String?)?
      textFieldAuthorTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for TextField_Location widget.
  FocusNode? textFieldLocationFocusNode;
  TextEditingController? textFieldLocationTextController;
  String? Function(BuildContext, String?)?
      textFieldLocationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();

    textFieldAuthorFocusNode?.dispose();
    textFieldAuthorTextController?.dispose();

    textFieldLocationFocusNode?.dispose();
    textFieldLocationTextController?.dispose();
  }
}
