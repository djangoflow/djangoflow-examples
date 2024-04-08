import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    super.key,
    required this.room,
  });

  final ChatRoom room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColoredBox(
        color: Colors.blue,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(room.title),
          ),
        ),
      ),
    );
  }
}
