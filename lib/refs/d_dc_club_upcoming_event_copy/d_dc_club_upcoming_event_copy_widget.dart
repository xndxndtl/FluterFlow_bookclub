import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'd_dc_club_upcoming_event_copy_model.dart';
export 'd_dc_club_upcoming_event_copy_model.dart';

class DDcClubUpcomingEventCopyWidget extends StatefulWidget {
  const DDcClubUpcomingEventCopyWidget({
    super.key,
    this.bookName,
    this.bookAuthor,
    required this.meetingDate,
    required this.meetingTime,
    this.meetingLocation,
    required this.meetingDoc,
    required this.meetingRef,
    String? meetingImageUrl,
  }) : this.meetingImageUrl = meetingImageUrl ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bookclub-75k2jc/assets/el2lb49qcv15/No_Image_Png.png';

  final String? bookName;
  final String? bookAuthor;
  final String? meetingDate;
  final String? meetingTime;
  final String? meetingLocation;
  final MeetingRecord? meetingDoc;
  final DocumentReference? meetingRef;
  final String meetingImageUrl;

  @override
  State<DDcClubUpcomingEventCopyWidget> createState() =>
      _DDcClubUpcomingEventCopyWidgetState();
}

class _DDcClubUpcomingEventCopyWidgetState
    extends State<DDcClubUpcomingEventCopyWidget> {
  late DDcClubUpcomingEventCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DDcClubUpcomingEventCopyModel());

    _model.switch1Value = widget!.meetingDoc?.meetingJoinUser
            ?.unique((e) => currentUserReference!)
            ?.length ==
        1;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 0.0, 0.0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0x00262D34),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  valueOrDefault<String>(
                    widget!.meetingImageUrl,
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bookclub-75k2jc/assets/f2m1v5wy1pt6/Noimage.png',
                  ),
                  width: 120.0,
                  height: 160.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 12.0, 15.0, 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget!.bookName!,
                    maxLines: 2,
                    minFontSize: 8.0,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget!.bookAuthor!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '일정: ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: widget!.meetingDate!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '시간 : ',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: widget!.meetingTime!,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '장소 : ',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: widget!.meetingLocation!,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '참석여부',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Switch.adaptive(
                          value: _model.switch1Value!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.switch1Value = newValue!);
                            if (newValue!) {
                              await widget!.meetingRef!.update({
                                ...mapToFirestore(
                                  {
                                    'meeting_join_user': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            } else {
                              await widget!.meetingRef!.update({
                                ...mapToFirestore(
                                  {
                                    'meeting_join_user': FieldValue.arrayRemove(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveTrackColor: Color(0x324B39EF),
                          inactiveThumbColor: Color(0x4C4B39EF),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
