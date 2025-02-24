import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'd_dc_club_meeting_edit_form_model.dart';
export 'd_dc_club_meeting_edit_form_model.dart';

class DDcClubMeetingEditFormWidget extends StatefulWidget {
  const DDcClubMeetingEditFormWidget({
    super.key,
    required this.meetingDoc,
    required this.meetingRef,
  });

  final MeetingRecord? meetingDoc;
  final DocumentReference? meetingRef;

  @override
  State<DDcClubMeetingEditFormWidget> createState() =>
      _DDcClubMeetingEditFormWidgetState();
}

class _DDcClubMeetingEditFormWidgetState
    extends State<DDcClubMeetingEditFormWidget> {
  late DDcClubMeetingEditFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DDcClubMeetingEditFormModel());

    _model.textFieldTitleTextController ??= TextEditingController();
    _model.textFieldTitleFocusNode ??= FocusNode();
    _model.textFieldTitleFocusNode!.addListener(() => safeSetState(() {}));
    _model.textFieldAuthorTextController ??= TextEditingController();
    _model.textFieldAuthorFocusNode ??= FocusNode();
    _model.textFieldAuthorFocusNode!.addListener(() => safeSetState(() {}));
    _model.textFieldLocationTextController ??=
        TextEditingController(text: widget!.meetingDoc?.meetingLocation);
    _model.textFieldLocationFocusNode ??= FocusNode();
    _model.textFieldLocationFocusNode!.addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 160.0,
              height: 200.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget!.meetingDoc!.meetingPhoto,
                  width: 120.0,
                  height: 252.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            TextFormField(
              controller: _model.textFieldTitleTextController,
              focusNode: _model.textFieldTitleFocusNode,
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelText: widget!.meetingDoc?.meetingName,
                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).error,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                filled: true,
                fillColor: (_model.textFieldTitleFocusNode?.hasFocus ?? false)
                    ? FlutterFlowTheme.of(context).accent1
                    : FlutterFlowTheme.of(context).secondaryBackground,
                prefixIcon: Icon(
                  Icons.menu_book_rounded,
                  color: (_model.textFieldTitleFocusNode?.hasFocus ?? false)
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator: _model.textFieldTitleTextControllerValidator
                  .asValidator(context),
            ),
            TextFormField(
              controller: _model.textFieldAuthorTextController,
              focusNode: _model.textFieldAuthorFocusNode,
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelText: widget!.meetingDoc?.meetingBookAuthor,
                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).error,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                filled: true,
                fillColor: (_model.textFieldAuthorFocusNode?.hasFocus ?? false)
                    ? FlutterFlowTheme.of(context).accent1
                    : FlutterFlowTheme.of(context).secondaryBackground,
                prefixIcon: Icon(
                  Icons.person,
                  color: (_model.textFieldAuthorFocusNode?.hasFocus ?? false)
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator: _model.textFieldAuthorTextControllerValidator
                  .asValidator(context),
            ),
            Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: FlutterFlowTheme.of(context).alternate,
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final _datePickedDate = await showDatePicker(
                      context: context,
                      initialDate: getCurrentTimestamp,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          headerForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          headerTextStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Inter Tight',
                                fontSize: 32.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                          pickerBackgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          pickerForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          selectedDateTimeBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          selectedDateTimeForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          actionButtonForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          iconSize: 24.0,
                        );
                      },
                    );

                    TimeOfDay? _datePickedTime;
                    if (_datePickedDate != null) {
                      _datePickedTime = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                        builder: (context, child) {
                          return wrapInMaterialTimePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            headerForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            headerTextStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            pickerBackgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            pickerForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            selectedDateTimeBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            selectedDateTimeForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            actionButtonForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            iconSize: 24.0,
                          );
                        },
                      );
                    }

                    if (_datePickedDate != null && _datePickedTime != null) {
                      safeSetState(() {
                        _model.datePicked = DateTime(
                          _datePickedDate.year,
                          _datePickedDate.month,
                          _datePickedDate.day,
                          _datePickedTime!.hour,
                          _datePickedTime.minute,
                        );
                      });
                    } else if (_model.datePicked != null) {
                      safeSetState(() {
                        _model.datePicked = getCurrentTimestamp;
                      });
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Text(
                        valueOrDefault<String>(
                          dateTimeFormat(
                            "y-M-d (EEE), a h:mm",
                            _model.datePicked,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          '일정 재선택',
                        ),
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: _model.textFieldLocationTextController,
              focusNode: _model.textFieldLocationFocusNode,
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelText: '장소',
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).error,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                filled: true,
                fillColor:
                    (_model.textFieldLocationFocusNode?.hasFocus ?? false)
                        ? FlutterFlowTheme.of(context).accent1
                        : FlutterFlowTheme.of(context).secondaryBackground,
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: (_model.textFieldLocationFocusNode?.hasFocus ?? false)
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator: _model.textFieldLocationTextControllerValidator
                  .asValidator(context),
            ),
            FFButtonWidget(
              onPressed: () async {
                await widget!.meetingRef!.update(createMeetingRecordData(
                  meetingDate: _model.datePicked,
                  meetingLocation: _model.textFieldLocationTextController.text,
                ));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '저장 성공',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
                context.safePop();
              },
              text: '수정 완료',
              options: FFButtonOptions(
                width: double.infinity,
                height: 48.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          content: Text('정말로 삭제하시겠습니까?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
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
                await widget!.meetingRef!.delete();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '모임 일정이 삭제되었습니다.',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
                context.safePop();
              },
              text: '모임 일정 삭제',
              options: FFButtonOptions(
                width: double.infinity,
                height: 48.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).error,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
