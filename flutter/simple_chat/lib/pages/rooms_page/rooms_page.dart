import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_bloc/flutter_list_bloc.dart';
import 'package:simple_chat/api/api_repository.dart';
import 'package:simple_chat/pages/home_page/home_page.dart';

import '../../widgets/room_item/room_item.dart';
import '../chat_page/chat_page.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  late final ChatRoomsListBloc chatRoomsListBloc;
  UserIdentity? currentUser;

  void onTapRoom(ChatRoom room) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatPage(
          room: room,
          currentUser: currentUser!,
        ),
      ),
    );
  }

  Future<void> init() async {
    try {
      chatRoomsListBloc = ChatRoomsListBloc()
        ..append(const ChatRoomsListFilter());
      // get current user
      currentUser =
          (await ApiRepository.instance.auth.authUsersRetrieve(id: '0')).data!;
    } catch (e) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple chat'),
      ),
      body: BlocProvider(
        create: (_) => chatRoomsListBloc,
        child: ContinuousListViewBlocBuilder<ChatRoomsListBloc, ChatRoom,
            ChatRoomsListFilter>(
          cubit: chatRoomsListBloc,
          itemBuilder: (_, __, i, item) => InkWell(
            onTap: () => onTapRoom(item),
            child: RoomItem(room: item),
          ),
          emptyBuilder: (_, state) => const SizedBox(),
          loadingBuilder: (_, state) => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
