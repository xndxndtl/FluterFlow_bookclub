import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/f_profile/faf_edit_profile_form/faf_edit_profile_form_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'fa_edit_profile_widget.dart' show FaEditProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FaEditProfileModel extends FlutterFlowModel<FaEditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Faf_editProfile_Form component.
  late FafEditProfileFormModel fafEditProfileFormModel;

  @override
  void initState(BuildContext context) {
    fafEditProfileFormModel =
        createModel(context, () => FafEditProfileFormModel());
  }

  @override
  void dispose() {
    fafEditProfileFormModel.dispose();
  }
}
