import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin<History> {
  @override
  void initState() {
    super.initState();
    print("history");
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text("history page"),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
