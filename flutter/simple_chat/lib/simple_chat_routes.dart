enum SimpleChatRoutes {
  home('/'),
  chatRooms('chat-rooms'),
  chatRoom('chat-room'),
  chatRoomInfo('chat-room-info');

  const SimpleChatRoutes(this.route);

  final String route;
}
