import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'da_create_club_form_model.dart';
export 'da_create_club_form_model.dart';

class DaCreateClubFormWidget extends StatefulWidget {
  const DaCreateClubFormWidget({
    super.key,
    required this.navigateAction,
    this.clubImage,
    this.clubDoc,
    this.clubregion,
    this.clubName,
    this.clubDescription,
  });

  final Future Function()? navigateAction;
  final String? clubImage;

  /// clubDoc
  final ClubsRecord? clubDoc;

  final String? clubregion;
  final String? clubName;
  final String? clubDescription;

  @override
  State<DaCreateClubFormWidget> createState() => _DaCreateClubFormWidgetState();
}

class _DaCreateClubFormWidgetState extends State<DaCreateClubFormWidget> {
  late DaCreateClubFormModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DaCreateClubFormModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.clubNameTextController ??=
        TextEditingController(text: widget!.clubName);
    _model.clubNameFocusNode ??= FocusNode();

    _model.clubDescriptionTextController ??=
        TextEditingController(text: widget!.clubDescription);
    _model.clubDescriptionFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 0.0, 0.0),
                child: Text(
                  '신규 클럽을 생성하고 모임을 만드세요.',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent2,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondary,
                      width: 2.0,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 200),
                              fadeOutDuration: Duration(milliseconds: 200),
                              imageUrl: valueOrDefault<String>(
                                _model.uploadedFileUrl,
                                'https://firebasestorage.googleapis.com/v0/b/bookclub-8e08d.appspot.com/o/users%2Fk7YCBbSDnnRIO5RSCSY36xaybKz1%2Fuploads%2F1736320310867788.jpg?alt=media&token=3221460a-3148-4c0b-9e87-ce2bfe930fe9',
                              ),
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 32.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final selectedMedia = await selectMedia(
                      mediaSource: MediaSource.photoGallery,
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        safeSetState(() {});
                        return;
                      }
                    }

                    await widget!.clubDoc!.reference
                        .update(createClubsRecordData(
                      clubImage: _model.uploadedFileUrl,
                    ));
                  },
                  text: '클럽 이미지 등록',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    elevation: 1.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
              child: TextFormField(
                controller: _model.clubNameTextController,
                focusNode: _model.clubNameFocusNode,
                autofillHints: [AutofillHints.name],
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: '클럽이름',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  hintText: '클럽 이름',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).error,
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primary,
                validator:
                    _model.clubNameTextControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
              child: FlutterFlowDropDown<String>(
                controller: _model.clubRegionValueController ??=
                    FormFieldController<String>(null),
                options: List<String>.from(
                    ['서울', '경기', '인천', '부산', '광주', '대전', '울산', '기타지역', '미설정']),
                optionLabels: [
                  '서울',
                  '경기',
                  '인천',
                  '부산',
                  '광주',
                  '대전',
                  '울산',
                  '기타지역',
                  '미설정'
                ],
                onChanged: (val) =>
                    safeSetState(() => _model.clubRegionValue = val),
                width: double.infinity,
                height: 44.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                hintText: '클럽 활동 지역',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
              child: TextFormField(
                controller: _model.clubDescriptionTextController,
                focusNode: _model.clubDescriptionFocusNode,
                textCapitalization: TextCapitalization.sentences,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: '클럽 소개글',
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
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                textAlign: TextAlign.start,
                maxLines: 3,
                cursorColor: FlutterFlowTheme.of(context).primary,
                validator: _model.clubDescriptionTextControllerValidator
                    .asValidator(context),
              ),
            ),
            if ((isWeb
                    ? MediaQuery.viewInsetsOf(context).bottom > 0
                    : _isKeyboardVisible) ==
                false)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.formKey.currentState != null) {
                        _model.formKey.currentState!.validate();
                      }
                      // updateUserInfo

                      await ClubsRecord.collection.doc().set({
                        ...createClubsRecordData(
                          clubName: _model.clubNameTextController.text,
                          clubImage: valueOrDefault<String>(
                            _model.uploadedFileUrl,
                            'https://firebasestorage.googleapis.com/v0/b/bookclub-8e08d.appspot.com/o/users%2Fk7YCBbSDnnRIO5RSCSY36xaybKz1%2Fuploads%2F1736320310867788.jpg?alt=media&token=3221460a-3148-4c0b-9e87-ce2bfe930fe9',
                          ),
                          clubOwner: currentUserReference,
                          clubRegion: valueOrDefault<String>(
                            _model.clubRegionValue,
                            '미설정',
                          ),
                          clubDescription: valueOrDefault<String>(
                            _model.clubDescriptionTextController.text,
                            '클럽 소개글이 없습니다.',
                          ),
                        ),
                        ...mapToFirestore(
                          {
                            'club_created_time': FieldValue.serverTimestamp(),
                            'club_members': [currentUserReference],
                          },
                        ),
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '클럽 생성이완료되었습니다',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                      context.safePop();
                    },
                    text: '신규 클럽 등록하기',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 44.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
