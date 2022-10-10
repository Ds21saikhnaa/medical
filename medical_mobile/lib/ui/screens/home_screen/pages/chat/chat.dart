import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:medical_mobile/ui/screens/home_screen/pages/chat/video_call.dart';
import 'package:permission_handler/permission_handler.dart';
// import '../chat/video_call.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Chat extends StatefulWidget {
  // final String? channelName;
  // final ClientRole? role;
  const Chat({
    Key? key,
    // this.channelName,
    // this.role
  }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with AutomaticKeepAliveClientMixin<Chat> {
  final _channelController = TextEditingController();
  bool _validaterError = false;
  ClientRole? _role = ClientRole.Broadcaster;
  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    print("chat");
  }

  Future<void> onJoin() async{
    setState(() {
      _channelController.text.isEmpty ? _validaterError = true : _validaterError = false;
    });
    if(_channelController.text.isNotEmpty){
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VideoCall(
              channelName: _channelController.text,
              role: _role,
            ),
        ),
      );
    }
  }
  Future<void> _handleCameraAndMic(Permission permission) async{
    final status = await permission.request();
    log(status.toString());
  }
  // Future<PermissionStatus> _handleCameraAndMic(Permission permission) async{
  //   final status = await permission.request();
  //   log(status.toString());
  //   // print(status);
  //   return status;
  //   // log(status.toString());
  // }
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children:[
                  SizedBox(height: 20),
                  TextField(
                     controller: _channelController,
                    decoration: InputDecoration(
                      errorText: _validaterError ? "channel name is mandatory" : null,
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                      hintText: "Channel name",
                    ),
                  ),
                  RadioListTile(
                      title: Text("Broadcaster"),
                      value: ClientRole.Broadcaster,
                      groupValue: _role,
                      onChanged: (ClientRole? value) {
                        setState(() {
                         _role = value;
                        });
                      }
                  ),
                  RadioListTile(
                      title: Text("Audience"),
                      value: ClientRole.Audience,
                      groupValue: _role,
                      onChanged: (ClientRole? value) {
                        setState(() {
                          _role = value;
                        });
                      }
                  ),
                  ElevatedButton(
                      onPressed: onJoin,
                      child: const Text("Join"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40),
                      ),
                  )
                  // Image.network('https://tinyurl.com/2p889y4k'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
