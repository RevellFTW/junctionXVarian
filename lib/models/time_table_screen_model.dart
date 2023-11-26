import 'package:syncfusion_flutter_calendar/calendar.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../screens/time_table_screen.dart' show TimeTableWidget;
import 'package:flutter/material.dart';
import '.././main.dart';

class HomeScreenModel extends FlutterFlowModel<TimeTableWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  MyAppDataSource get dataSource {
    final List<Appointment> appointments = <Appointment>[
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 1)),
        subject: 'Patient 1',
        color: Colors.blue,
      ),
      // Add more appointments here...
    ];
    return MyAppDataSource(appointments: appointments);
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
