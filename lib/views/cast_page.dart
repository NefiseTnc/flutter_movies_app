import 'package:flutter/material.dart';

class CastPage extends StatelessWidget {
  const CastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blueAccent,
      width: size.width,
      height: size.height,
    );
  }
}
