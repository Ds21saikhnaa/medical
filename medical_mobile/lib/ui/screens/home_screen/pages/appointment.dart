import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> with AutomaticKeepAliveClientMixin<Appointment> {
  @override
  void initState() {
    super.initState();
    print("appoint");
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text("AppointmentState page"),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
