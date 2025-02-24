import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/e_search/search_book_comp/search_book_comp_widget.dart';
import 'e_search_widget.dart' show ESearchWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ESearchModel extends FlutterFlowModel<ESearchWidget> {
  ///  Local state fields for this page.

  List<dynamic> test = [];
  void addToTest(dynamic item) => test.add(item);
  void removeFromTest(dynamic item) => test.remove(item);
  void removeAtIndexFromTest(int index) => test.removeAt(index);
  void insertAtIndexInTest(int index, dynamic item) => test.insert(index, item);
  void updateTestAtIndex(int index, Function(dynamic) updateFn) =>
      test[index] = updateFn(test[index]);

  ///  State fields for stateful widgets in this page.

  // Model for SearchBook_Comp component.
  late SearchBookCompModel searchBookCompModel;

  @override
  void initState(BuildContext context) {
    searchBookCompModel = createModel(context, () => SearchBookCompModel());
  }

  @override
  void dispose() {
    searchBookCompModel.dispose();
  }
}
