import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/d_book_club/d_c_debate/d_de_club_debate_form/d_de_club_debate_form_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'd_de_club_debate_model.dart';
export 'd_de_club_debate_model.dart';

class DDeClubDebateWidget extends StatefulWidget {
  const DDeClubDebateWidget({
    super.key,
    this.meetingDoc,
  });

  final MeetingRecord? meetingDoc;

  static String routeName = 'DDe_Club_Debate';
  static String routePath = '/dDeClubDebate';

  @override
  State<DDeClubDebateWidget> createState() => _DDeClubDebateWidgetState();
}

class _DDeClubDebateWidgetState extends State<DDeClubDebateWidget> {
  late DDeClubDebateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DDeClubDebateModel());
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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 55.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 25.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '발제문',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Inter Tight',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: StreamBuilder<DebatesRecord>(
          stream: DebatesRecord.getDocument(widget!.meetingDoc!.meetingDebate!),
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

            final columnDebatesRecord = snapshot.data!;

            return SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 770.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.dDeClubDebateFormModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DDeClubDebateFormWidget(
                          meetingDoc: widget!.meetingDoc,
                          debateDoc: columnDebatesRecord,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
