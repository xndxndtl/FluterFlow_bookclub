import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'd_de_club_debate_form_copy_widget.dart'
    show DDeClubDebateFormCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DDeClubDebateFormCopyModel
    extends FlutterFlowModel<DDeClubDebateFormCopyWidget> {
  ///  Local state fields for this component.

  List<String> debatesContentsFields = ['baljemoon'];
  void addToDebatesContentsFields(String item) =>
      debatesContentsFields.add(item);
  void removeFromDebatesContentsFields(String item) =>
      debatesContentsFields.remove(item);
  void removeAtIndexFromDebatesContentsFields(int index) =>
      debatesContentsFields.removeAt(index);
  void insertAtIndexInDebatesContentsFields(int index, String item) =>
      debatesContentsFields.insert(index, item);
  void updateDebatesContentsFieldsAtIndex(
          int index, Function(String) updateFn) =>
      debatesContentsFields[index] = updateFn(debatesContentsFields[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
