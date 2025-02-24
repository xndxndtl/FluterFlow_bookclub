import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/d_book_club/d_b_meeting/d_dc_club_meeting_block/d_dc_club_meeting_block_widget.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_home_model.dart';
export 'c_home_model.dart';

class CHomeWidget extends StatefulWidget {
  const CHomeWidget({super.key});

  static String routeName = 'C_Home';
  static String routePath = '/cHome';

  @override
  State<CHomeWidget> createState() => _CHomeWidgetState();
}

class _CHomeWidgetState extends State<CHomeWidget> {
  late CHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Booktandard',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              buttonSize: 48.0,
              icon: Icon(
                Icons.notifications_none,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentUserDisplayName,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(
                          text: '님의 참석 예정 모임',
                          style: TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 5.0),
                  child: StreamBuilder<List<MeetingRecord>>(
                    stream: FFAppState().upcomingEvent(
                      requestFn: () => queryMeetingRecord(
                        queryBuilder: (meetingRecord) => meetingRecord
                            .where(
                              'meeting_join_user',
                              arrayContains: currentUserReference,
                            )
                            .orderBy('meeting_date'),
                        limit: 2,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<MeetingRecord>
                          listViewUpcomingEventMeetingRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            listViewUpcomingEventMeetingRecordList.length,
                        itemBuilder: (context, listViewUpcomingEventIndex) {
                          final listViewUpcomingEventMeetingRecord =
                              listViewUpcomingEventMeetingRecordList[
                                  listViewUpcomingEventIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: DDcClubMeetingBlockWidget(
                                key: Key(
                                    'Keyzo7_${listViewUpcomingEventIndex}_of_${listViewUpcomingEventMeetingRecordList.length}'),
                                bookName: listViewUpcomingEventMeetingRecord
                                    .meetingName,
                                bookAuthor: listViewUpcomingEventMeetingRecord
                                    .meetingBookAuthor,
                                meetingDate: dateTimeFormat(
                                  "y-M-d (EEE)",
                                  listViewUpcomingEventMeetingRecord
                                      .meetingDate!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                meetingTime: dateTimeFormat(
                                  "a h:mm ",
                                  listViewUpcomingEventMeetingRecord
                                      .meetingDate!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                meetingLocation:
                                    listViewUpcomingEventMeetingRecord
                                        .meetingLocation,
                                meetingDoc: listViewUpcomingEventMeetingRecord,
                                meetingRef: listViewUpcomingEventMeetingRecord
                                    .reference,
                                meetingImageUrl:
                                    listViewUpcomingEventMeetingRecord
                                        .meetingPhoto,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
