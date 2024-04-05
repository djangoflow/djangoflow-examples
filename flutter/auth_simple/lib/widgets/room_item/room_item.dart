import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    super.key,
    required this.room,
    this.lastMessage,
  });

  final RoomEntity room;
  final String? lastMessage;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(room.title),
            const SizedBox(height: 12),
            Text(lastMessage ?? ''),
          ],
        ),
      ),
    );
  }
}
