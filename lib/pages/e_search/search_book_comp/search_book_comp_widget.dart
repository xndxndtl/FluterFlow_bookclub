import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'search_book_comp_model.dart';
export 'search_book_comp_model.dart';

class SearchBookCompWidget extends StatefulWidget {
  const SearchBookCompWidget({super.key});

  @override
  State<SearchBookCompWidget> createState() => _SearchBookCompWidgetState();
}

class _SearchBookCompWidgetState extends State<SearchBookCompWidget> {
  late SearchBookCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBookCompModel());

    _model.textFieldSearchwordTextController ??= TextEditingController();
    _model.textFieldSearchwordFocusNode ??= FocusNode();
    _model.textFieldSearchwordFocusNode!.addListener(() => safeSetState(() {}));
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
        children: [
          TextFormField(
            controller: _model.textFieldSearchwordTextController,
            focusNode: _model.textFieldSearchwordFocusNode,
            onFieldSubmitted: (_) async {
              safeSetState(() => _model.listViewPagingController?.refresh());
              await _model.waitForOnePageForListView();
            },
            autofocus: false,
            textCapitalization: TextCapitalization.sentences,
            obscureText: false,
            decoration: InputDecoration(
              labelText: '도서 검색하기..',
              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  (_model.textFieldSearchwordFocusNode?.hasFocus ?? false)
                      ? FlutterFlowTheme.of(context).accent1
                      : FlutterFlowTheme.of(context).secondaryBackground,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: (_model.textFieldSearchwordFocusNode?.hasFocus ?? false)
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
            cursorColor: FlutterFlowTheme.of(context).primary,
            validator: _model.textFieldSearchwordTextControllerValidator
                .asValidator(context),
          ),
          RefreshIndicator(
            onRefresh: () async {
              safeSetState(() => _model.listViewPagingController?.refresh());
              await _model.waitForOnePageForListView();
            },
            child: PagedListView<ApiPagingParams, dynamic>(
              pagingController: _model.setListViewController(
                (nextPageMarker) => BookinfoCall.call(
                  searchKeyword: _model.textFieldSearchwordTextController.text,
                ),
              ),
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              reverse: false,
              scrollDirection: Axis.vertical,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
                // Customize what your widget looks like when it's loading the first page.
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                ),
                // Customize what your widget looks like when it's loading another page.
                newPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                ),

                itemBuilder: (context, _, apilistIndex) {
                  final apilistItem =
                      _model.listViewPagingController!.itemList![apilistIndex];
                  return Container(
                    width: 100.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                10.0, 10.0, 10.0, 10.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context).alternate,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: Image.network(
                                  getJsonField(
                                    apilistItem,
                                    r'''$.thumbnail''',
                                  ).toString(),
                                  width: 81.0,
                                  height: 160.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 12.0, 15.0, 10.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 1.0),
                                        child: AutoSizeText(
                                          getJsonField(
                                            apilistItem,
                                            r'''$.title''',
                                          ).toString(),
                                          maxLines: 2,
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 1.0),
                                        child: AutoSizeText(
                                          getJsonField(
                                            apilistItem,
                                            r'''$.authors[:]''',
                                          ).toString(),
                                          maxLines: 2,
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 2.0),
                                        child: AutoSizeText(
                                          getJsonField(
                                            apilistItem,
                                            r'''$.contents''',
                                          ).toString().maybeHandleOverflow(
                                                maxChars: 50,
                                                replacement: '…',
                                              ),
                                          maxLines: 3,
                                          minFontSize: 10.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
          ),
        ],
      ),
    );
  }
}
