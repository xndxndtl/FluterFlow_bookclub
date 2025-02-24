import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'd_dc_club_meeting_create_form_widget.dart'
    show DDcClubMeetingCreateFormWidget;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class DDcClubMeetingCreateFormModel
    extends FlutterFlowModel<DDcClubMeetingCreateFormWidget> {
  ///  Local state fields for this component.

  bool imageOnOFF = false;

  String imageUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bookclub-75k2jc/assets/el2lb49qcv15/No_Image_Png.png';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_SearchKeyword widget.
  FocusNode? textFieldSearchKeywordFocusNode;
  TextEditingController? textFieldSearchKeywordTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchKeywordTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // State field(s) for TextField_Title widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldTitleTextControllerValidator;
  // State field(s) for TextField_Author widget.
  FocusNode? textFieldAuthorFocusNode;
  TextEditingController? textFieldAuthorTextController;
  String? Function(BuildContext, String?)?
      textFieldAuthorTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for TextField_Location widget.
  FocusNode? textFieldLocationFocusNode;
  TextEditingController? textFieldLocationTextController;
  String? Function(BuildContext, String?)?
      textFieldLocationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSearchKeywordFocusNode?.dispose();
    textFieldSearchKeywordTextController?.dispose();

    listViewPagingController?.dispose();
    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();

    textFieldAuthorFocusNode?.dispose();
    textFieldAuthorTextController?.dispose();

    textFieldLocationFocusNode?.dispose();
    textFieldLocationTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewBookinfoPage);
  }

  void listViewBookinfoPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewBookinfoResponse) {
        final pageItems = (getJsonField(
                  listViewBookinfoResponse.jsonBody,
                  r'''$.documents''',
                ) ??
                [])
            .take(15 - nextPageMarker.numItems)
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0) && newNumItems < 15
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewBookinfoResponse,
                )
              : null,
        );
      });
}
