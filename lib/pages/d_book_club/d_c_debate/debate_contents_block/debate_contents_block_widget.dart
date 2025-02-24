import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'debate_contents_block_model.dart';
export 'debate_contents_block_model.dart';

class DebateContentsBlockWidget extends StatefulWidget {
  const DebateContentsBlockWidget({
    super.key,
    this.debateDoc,
    this.debateContentsDoc,
  });

  final DebatesRecord? debateDoc;
  final DebateContentsRecord? debateContentsDoc;

  @override
  State<DebateContentsBlockWidget> createState() =>
      _DebateContentsBlockWidgetState();
}

class _DebateContentsBlockWidgetState extends State<DebateContentsBlockWidget> {
  late DebateContentsBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DebateContentsBlockModel());

    _model.textController ??=
        TextEditingController(text: widget!.debateContentsDoc?.contents);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.6,
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              autofocus: false,
              readOnly: _model.edit == false,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: _model.edit != false
                    ? FlutterFlowTheme.of(context).primaryBackground
                    : FlutterFlowTheme.of(context).alternate,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              maxLines: null,
              cursorColor: FlutterFlowTheme.of(context).primaryText,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (_model.edit == false)
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 32.0,
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 16.0,
                    ),
                    onPressed: () async {
                      _model.edit = true;
                      safeSetState(() {});
                    },
                  ),
                ),
              if (_model.edit != false)
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 32.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.save,
                      color: FlutterFlowTheme.of(context).info,
                      size: 16.0,
                    ),
                    onPressed: () async {
                      _model.edit = true;
                      safeSetState(() {});

                      await widget!.debateContentsDoc!.reference
                          .update(createDebateContentsRecordData(
                        contents: _model.textController.text,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '저장 완료',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          duration: Duration(milliseconds: 1000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                      _model.edit = false;
                      safeSetState(() {});
                    },
                  ),
                ),
              if (_model.edit != false)
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 32.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: FaIcon(
                      FontAwesomeIcons.trashAlt,
                      color: FlutterFlowTheme.of(context).info,
                      size: 16.0,
                    ),
                    onPressed: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text('삭제하시겠습니까?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('아니오'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('예'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (!confirmDialogResponse) {
                        return;
                      }
                      await widget!.debateContentsDoc!.reference.delete();
                    },
                  ),
                ),
            ].divide(SizedBox(width: 5.0)),
          ),
        ],
      ),
    );
  }
}
