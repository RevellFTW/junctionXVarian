import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/home_screen_model.dart';
export '../models/home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget>
    with TickerProviderStateMixin {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Text(
                                      'VarianApp',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.black,
                                            fontSize: 22,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Assign patient',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 50,
                                      icon: Icon(
                                        Icons.dehaze_sharp,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('settings');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2,
          ),
        ),
        body: Container(
          child: SfCalendar(
            view: CalendarView.week,
            dataSource: _getCalendarDataSource(),
            allowDragAndDrop: true,
          ),
        ),
      ),
    );
  }

  _MyAppDataSource _getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 1)),
        subject: 'Patient 1',
        color: Colors.blue,
      ),
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 1)),
        subject: 'Patient 1',
        color: Colors.blue,
      ),
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 1)),
        subject: 'Patient 1',
        color: Colors.blue,
      ),
      // Add more appointments here...
    ];
    return _MyAppDataSource(appointments: appointments);
  }
}

class _MyAppDataSource extends CalendarDataSource {
  _MyAppDataSource({required List<Appointment> appointments}) : super();
}

void _onTap(CalendarTapDetails details) {
  if (details.targetElement == CalendarElement.appointment) {
    // Existing code...
  } else if (details.targetElement == CalendarElement.calendarCell) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Start Time: ${details.date}'),
              Text('End Time: ${details.date!.add(Duration(hours: 1))}'),
              Text('Subject: Dummy Data'),
              Text('Color: Blue'),
              ElevatedButton(
                onPressed: () {
                  _addAppointment(
                    details.date!,
                    details.date!.add(Duration(hours: 1)),
                    'Dummy Data',
                    Colors.blue,
                  );
                  Navigator.of(context).pop();
                },
                child: Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }
}

void _addAppointment(
    DateTime startTime, DateTime endTime, String subject, Color color) {
  setState(() {
    _model.dataSource.appointments!.add(
      Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: subject,
        color: color,
      ),
    );
  });
}
