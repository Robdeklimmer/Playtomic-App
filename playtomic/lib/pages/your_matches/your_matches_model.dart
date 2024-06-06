import '/flutter_flow/flutter_flow_util.dart';
import 'your_matches_widget.dart' show YourMatchesWidget;
import 'package:flutter/material.dart';

class YourMatchesModel extends FlutterFlowModel<YourMatchesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
