import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
import 'package:flutter/material.dart';
import 'package:medical_mobile/utils/settings.dart';
// import '../../../../../utils/settings.dart';
class VideoCall extends StatefulWidget {
  final String? channelName;
  final ClientRole? role;
  const VideoCall({Key? key, this.channelName,
    this.role}) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final _users = <int>[];
  final _infoString = <String>[];
  bool muted = false;
  bool viewPanel = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose(){
    _users.clear();
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  Future<void> initialize() async{
    if(appId.isEmpty){
      setState(() {
        _infoString.add(
          "APP_ID missing, please provide your APP_ID in settings.dart",
        );
        _infoString.add(
          "Agora Engine is not starting",
        );
      });
      return;
    }

    //! _initAgoraRtcEngine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.role!);
    //! _addAgoraEventHandler
    _addAgoraEventHandler();
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = const VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(token, widget.channelName!, null, 0);
  }

  void _addAgoraEventHandler() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        final info = "Error: $code";
        _infoString.add(info);
      });
    }, joinChannelSuccess: (channel, uid, elapsed){
      setState(() {
        final info = "Join Channel: $channel, uid: $uid";
        _infoString.add(info);
      });
    }, leaveChannel: (stats){
      setState(() {
        _infoString.add("leave channel");
        _users.clear();
      });
    },userJoined: (uid, elapsed){
      setState(() {
        final info = "Join Joined: $uid";
        _infoString.add(info);
        _users.add(uid);
      });
    }, userOffline: (uid, elapsed){
      setState(() {
        final info = "user offline: $uid";
        _infoString.add(info);
        _users.remove(uid);
      });
    }, firstRemoteVideoFrame: (uid, width, height, elapsed){
      setState(() {
        final info = "First Remote Video: $uid ${width}x $height";
        _infoString.add(info);
      });
    }),
    );
  }

  Widget _viewRows() {
    final List<StatefulWidget> list = [];
    if(widget.role == ClientRole.Broadcaster){
      list.add(const rtc_local_view.SurfaceView());
    }
    for(var uid in _users){
      list.add(rtc_remote_view.SurfaceView(
        uid: uid,
        //uid: 0,
        channelId: widget.channelName!,
      ));
    }
    final views = list;
    return Column(
      children: List.generate(
            views.length,
              (index) => Expanded(
            child: views[index],
              ),
    ),
    );
  }

  Widget _toolbar() {
    if(widget.role == ClientRole.Audience) return const SizedBox();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        children: [
          RawMaterialButton(
              onPressed: () {
                setState(() {
                  muted = !muted;
                });
                _engine.muteLocalAudioStream(muted);
              },
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: () => _engine.switchCamera(),
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
        ],
      ),
    );
  }

  Widget _panel() {
    return Visibility(
      visible: viewPanel,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 48),
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
          heightFactor: 0.5,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: ListView.builder(
              reverse: true,
              itemCount: _infoString.length,
              itemBuilder: (BuildContext context, int index){
                if(_infoString.isEmpty){
                  return const Text("null");
                }
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child:Container(
                            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              _infoString[index],
                            ),
                          ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              _viewRows(),
              _panel(),
              _toolbar()
            ],
          ),
        )
      ),
    );
  }
}
