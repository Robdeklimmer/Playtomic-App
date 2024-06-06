import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_court_page1_widget.dart' show BookCourtPage1Widget;
import 'package:flutter/material.dart';

class BookCourtPage1Model extends FlutterFlowModel<BookCourtPage1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for LocationFilter widget.
  final locationFilterKey = GlobalKey();
  FocusNode? locationFilterFocusNode;
  TextEditingController? locationFilterTextController;
  String? locationFilterSelectedOption;
  String? Function(BuildContext, String?)?
      locationFilterTextControllerValidator;
  List<CourtRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    locationFilterFocusNode?.dispose();
  }
}
