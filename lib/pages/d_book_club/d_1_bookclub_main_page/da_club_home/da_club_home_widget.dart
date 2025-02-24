import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/d_book_club/d_a_home/d_db_club_home_comp/d_db_club_home_comp_widget.dart';
import '/pages/d_book_club/d_b_meeting/d_dc_club_meeting/d_dc_club_meeting_widget.dart';
import '/pages/d_book_club/d_e_club_mgmt/d_e_club_mgmt/d_e_club_mgmt_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'da_club_home_model.dart';
export 'da_club_home_model.dart';

class DaClubHomeWidget extends StatefulWidget {
  const DaClubHomeWidget({
    super.key,
    required this.clubinfo,
  });

  final ClubsRecord? clubinfo;

  static String routeName = 'Da_Club_Home';
  static String routePath = '/daClubHome';

  @override
  State<DaClubHomeWidget> createState() => _DaClubHomeWidgetState();
}

class _DaClubHomeWidgetState extends State<DaClubHomeWidget>
    with TickerProviderStateMixin {
  late DaClubHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DaClubHomeModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
            'Bookclub',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
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
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Inter Tight',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                      unselectedLabelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Inter Tight',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      tabs: [
                        Tab(
                          text: '홈',
                        ),
                        Tab(
                          text: '일정',
                        ),
                        Tab(
                          text: '발제',
                        ),
                        Tab(
                          text: '투표',
                        ),
                        Tab(
                          text: '관리',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [
                          () async {},
                          () async {},
                          () async {},
                          () async {},
                          () async {}
                        ][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        wrapWithModel(
                          model: _model.dDbClubHomeCompModel,
                          updateCallback: () => safeSetState(() {}),
                          child: DDbClubHomeCompWidget(
                            clubinfo: widget!.clubinfo!,
                            clubinfoDocRef: widget!.clubinfo!.reference,
                          ),
                        ),
                        Stack(
                          children: [
                            if (widget!.clubinfo?.clubMembers
                                    ?.contains(currentUserReference) ==
                                true)
                              wrapWithModel(
                                model: _model.dDcClubMeetingModel,
                                updateCallback: () => safeSetState(() {}),
                                child: DDcClubMeetingWidget(
                                  clubinfo: widget!.clubinfo!,
                                ),
                              ),
                            if (widget!.clubinfo?.clubMembers
                                    ?.contains(currentUserReference) ==
                                false)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '클럽 가입 후 접근 가능합니다.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                          ],
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                '업데이트 예정입니다.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                '업데이트 예정입니다.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            if (widget!.clubinfo?.clubOwner ==
                                currentUserReference)
                              wrapWithModel(
                                model: _model.dEClubMgmtModel,
                                updateCallback: () => safeSetState(() {}),
                                child: DEClubMgmtWidget(
                                  clubinfo: widget!.clubinfo,
                                ),
                              ),
                            if (widget!.clubinfo?.clubOwner !=
                                currentUserReference)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '클럽 운영자만 접근 가능합니다.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
