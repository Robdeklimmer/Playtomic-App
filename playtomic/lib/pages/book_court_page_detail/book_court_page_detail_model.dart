import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'book_court_page_detail_widget.dart' show BookCourtPageDetailWidget;
import 'package:flutter/material.dart';

class BookCourtPageDetailModel
    extends FlutterFlowModel<BookCourtPageDetailWidget> {
  ///  Local state fields for this page.

  String? startTime = 'null';

  String? endTime = 'null';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DateDropdDown widget.
  String? dateDropdDownValue;
  FormFieldController<String>? dateDropdDownValueController;
  // State field(s) for TimeDropDown widget.
  String? timeDropDownValue;
  FormFieldController<String>? timeDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AvailableTimesRecord? buttonQueryTime;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  AvailableDatesRecord? buttonQueryDate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
