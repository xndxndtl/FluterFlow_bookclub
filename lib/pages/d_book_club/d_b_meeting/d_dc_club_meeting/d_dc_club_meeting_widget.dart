import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/d_book_club/d_b_meeting/d_dc_club_meeting_block/d_dc_club_meeting_block_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'd_dc_club_meeting_model.dart';
export 'd_dc_club_meeting_model.dart';

class DDcClubMeetingWidget extends StatefulWidget {
  const DDcClubMeetingWidget({
    super.key,
    required this.clubinfo,
  });

  final ClubsRecord? clubinfo;

  @override
  State<DDcClubMeetingWidget> createState() => _DDcClubMeetingWidgetState();
}

class _DDcClubMeetingWidgetState extends State<DDcClubMeetingWidget> {
  late DDcClubMeetingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DDcClubMeetingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 30.0),
              child: Container(
                width: double.infinity,
                height: 52.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, -1.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      DDcClubMeetingCreateWidget.routeName,
                      queryParameters: {
                        'clubs': serializeParam(
                          widget!.clubinfo,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'clubs': widget!.clubinfo,
                      },
                    );
                  },
                  text: '+ 신규 일정 등록',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                child: Text(
                  '예정 모임',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 5.0),
                  child: StreamBuilder<List<MeetingRecord>>(
                    stream: queryMeetingRecord(
                      parent: widget!.clubinfo?.reference,
                      queryBuilder: (meetingRecord) => meetingRecord
                          .where(
                            'meeting_date',
                            isGreaterThan: getCurrentTimestamp,
                          )
                          .orderBy('meeting_date'),
                      limit: 6,
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

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            listViewUpcomingEventMeetingRecordList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 5.0),
                        itemBuilder: (context, listViewUpcomingEventIndex) {
                          final listViewUpcomingEventMeetingRecord =
                              listViewUpcomingEventMeetingRecordList[
                                  listViewUpcomingEventIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
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
                                    'Key382_${listViewUpcomingEventIndex}_of_${listViewUpcomingEventMeetingRecordList.length}'),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                child: Text(
                  '지난 모임',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 5.0),
                  child: StreamBuilder<List<MeetingRecord>>(
                    stream: queryMeetingRecord(
                      parent: widget!.clubinfo?.reference,
                      queryBuilder: (meetingRecord) => meetingRecord
                          .where(
                            'meeting_date',
                            isLessThan: getCurrentTimestamp,
                          )
                          .orderBy('meeting_date'),
                      limit: 12,
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
                      List<MeetingRecord> listViewDoneEventMeetingRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewDoneEventMeetingRecordList.length,
                        itemBuilder: (context, listViewDoneEventIndex) {
                          final listViewDoneEventMeetingRecord =
                              listViewDoneEventMeetingRecordList[
                                  listViewDoneEventIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              height: 220.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 10.0, 0.0, 0.0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0x00262D34),
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Opacity(
                                          opacity: 0.5,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                listViewDoneEventMeetingRecord
                                                    .meetingPhoto,
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
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 12.0, 15.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Opacity(
                                              opacity: 0.5,
                                              child: AutoSizeText(
                                                listViewDoneEventMeetingRecord
                                                    .meetingName,
                                                minFontSize: 8.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.5,
                                              child: Text(
                                                listViewDoneEventMeetingRecord
                                                    .meetingBookAuthor,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.5,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    "y-M-d (EEE)",
                                                    listViewDoneEventMeetingRecord
                                                        .meetingDate!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.5,
                                              child: Text(
                                                dateTimeFormat(
                                                  "a h:mm ",
                                                  listViewDoneEventMeetingRecord
                                                      .meetingDate!,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.6,
                                              child: Text(
                                                listViewDoneEventMeetingRecord
                                                    .meetingLocation,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
        ],
      ),
    );
  }
}
