import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_chat/chat_room/chat_room.dart';
import '../api_repository.dart';

class ChatRoomInfoPage extends StatelessWidget {
  const ChatRoomInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider<ChatRoomsDataBloc>(
          create: (context) =>
              ChatRoomsDataBloc()..load(ChatRoomsRetrieveFilter(id: id)),
          child: BlocBuilder<ChatRoomsDataBloc, ChatRoomsRetrieveState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ChannelInfoCard(
                    icon: Icons.calendar_today,
                    title: 'Creation Date',
                    value: state.data?.created.format() ?? '',
                  ),
                  const SizedBox(height: 16.0),
                  ChannelInfoCard(
                    icon: Icons.tv,
                    title: 'Channel Type',
                    value: state.data?.chatType?.value ?? '',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChannelInfoCard extends StatelessWidget {
  const ChannelInfoCard({
    required this.icon,
    required this.title,
    required this.value,
    super.key,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: 10.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
