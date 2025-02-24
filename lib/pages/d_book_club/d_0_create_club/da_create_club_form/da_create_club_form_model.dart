import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import 'da_create_club_form_widget.dart' show DaCreateClubFormWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DaCreateClubFormModel extends FlutterFlowModel<DaCreateClubFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for club_name widget.
  FocusNode? clubNameFocusNode;
  TextEditingController? clubNameTextController;
  String? Function(BuildContext, String?)? clubNameTextControllerValidator;
  String? _clubNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'clubName is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for club_region widget.
  String? clubRegionValue;
  FormFieldController<String>? clubRegionValueController;
  // State field(s) for club_description widget.
  FocusNode? clubDescriptionFocusNode;
  TextEditingController? clubDescriptionTextController;
  String? Function(BuildContext, String?)?
      clubDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {
    clubNameTextControllerValidator = _clubNameTextControllerValidator;
  }

  @override
  void dispose() {
    clubNameFocusNode?.dispose();
    clubNameTextController?.dispose();

    clubDescriptionFocusNode?.dispose();
    clubDescriptionTextController?.dispose();
  }
}
