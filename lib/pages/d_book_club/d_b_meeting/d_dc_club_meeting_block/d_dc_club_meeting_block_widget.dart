import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'd_dc_club_meeting_block_model.dart';
export 'd_dc_club_meeting_block_model.dart';

class DDcClubMeetingBlockWidget extends StatefulWidget {
  const DDcClubMeetingBlockWidget({
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
  State<DDcClubMeetingBlockWidget> createState() =>
      _DDcClubMeetingBlockWidgetState();
}

class _DDcClubMeetingBlockWidgetState extends State<DDcClubMeetingBlockWidget> {
  late DDcClubMeetingBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DDcClubMeetingBlockModel());

    _model.switch1Value =
        widget!.meetingDoc?.meetingJoinUser?.contains(currentUserReference) ==
            true;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
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
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
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
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 12.0, 15.0, 0.0),
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
                      maxLines: 1,
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
                              text: '일정  ',
                              style: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w300,
                              ),
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                            text: '시간  ',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: widget!.meetingTime!,
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
                    ),
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '장소  ',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: widget!.meetingLocation!,
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
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '참석여부',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Switch.adaptive(
                            value: _model.switch1Value!,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.switch1Value = newValue!);
                              if (newValue!) {
                                await widget!.meetingRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'meeting_join_user':
                                          FieldValue.arrayUnion(
                                              [currentUserReference]),
                                    },
                                  ),
                                });
                              } else {
                                await widget!.meetingRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'meeting_join_user':
                                          FieldValue.arrayRemove(
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
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 120.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (!widget!.meetingDoc!.hasMeetingDebate()) {
                        var debatesRecordReference =
                            DebatesRecord.collection.doc();
                        await debatesRecordReference.set({
                          ...createDebatesRecordData(
                            debateOwner: currentUserReference,
                            relatedMeeting: widget!.meetingDoc?.reference,
                          ),
                          ...mapToFirestore(
                            {
                              'debate_create_time':
                                  FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        _model.createdDebate =
                            DebatesRecord.getDocumentFromData({
                          ...createDebatesRecordData(
                            debateOwner: currentUserReference,
                            relatedMeeting: widget!.meetingDoc?.reference,
                          ),
                          ...mapToFirestore(
                            {
                              'debate_create_time': DateTime.now(),
                            },
                          ),
                        }, debatesRecordReference);

                        await widget!.meetingRef!
                            .update(createMeetingRecordData(
                          meetingDebate: _model.createdDebate?.reference,
                        ));
                      }

                      context.pushNamed(
                        DDeClubDebateWidget.routeName,
                        queryParameters: {
                          'meetingDoc': serializeParam(
                            widget!.meetingDoc,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'meetingDoc': widget!.meetingDoc,
                        },
                      );

                      safeSetState(() {});
                    },
                    text: '발제문',
                    options: FFButtonOptions(
                      width: 80.0,
                      height: 30.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    width: 100.0,
                    height: 30.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) {
                            final meetingJoinUserDynamicChildren =
                                widget!.meetingDoc?.meetingJoinUser?.toList() ??
                                    [];

                            return Stack(
                              children: List.generate(
                                  meetingJoinUserDynamicChildren.length,
                                  (meetingJoinUserDynamicChildrenIndex) {
                                final meetingJoinUserDynamicChildrenItem =
                                    meetingJoinUserDynamicChildren[
                                        meetingJoinUserDynamicChildrenIndex];
                                return Align(
                                  alignment: AlignmentDirectional(
                                      valueOrDefault<double>(
                                        -0.9 +
                                            (meetingJoinUserDynamicChildrenIndex *
                                                0.3),
                                        0.0,
                                      ),
                                      -1.0),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        meetingJoinUserDynamicChildrenItem),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final circleImageUsersRecord =
                                          snapshot.data!;

                                      return Container(
                                        width: 30.0,
                                        height: 30.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            circleImageUsersRecord.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bookclub-75k2jc/assets/btifk8qup8sv/no_image_profile.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                        if (widget!.meetingDoc?.meetingOwner ==
                            currentUserReference)
                          Flexible(
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              buttonSize: 30.0,
                              icon: FaIcon(
                                FontAwesomeIcons.solidEdit,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(
                                  DDcClubMeetingEditWidget.routeName,
                                  queryParameters: {
                                    'meetingDoc': serializeParam(
                                      widget!.meetingDoc,
                                      ParamType.Document,
                                    ),
                                    'meetingRef': serializeParam(
                                      widget!.meetingRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'meetingDoc': widget!.meetingDoc,
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
