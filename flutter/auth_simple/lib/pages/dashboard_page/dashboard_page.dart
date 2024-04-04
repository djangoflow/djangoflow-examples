import 'package:auto_route/auto_route.dart';
import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:djangoflow_websocket/djangoflow_websocket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config.dart';
import '../../core/routes/app_router.gr.dart';
import '../../core/routes/router.dart';
import '../../state/rooms_cubit/rooms_cubit.dart';
import '../../state/rooms_cubit/rooms_state.dart';
import '../../widgets/room_item/room_item.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final scrollController = ScrollController();
  final websocketCubit = DjangoflowWebsocketCubit(
    config: DjangoflowWebsocketConfig(),
  );

  final roomsCubit = RoomsCubit(
    DjangoflowOpenapi(
      interceptors: [JwtAuthInterceptor()],
    ).getRoomsApi(),
  );

  Future<void> getRooms() async {
    try {
      await roomsCubit.loadData();
    } catch (e) {
      await router.replace(const HomeRoute());
    }
  }

  ///TODO check socket part
  // Future<void> connectSocket() async {
  //   try {
  //     final uri = Uri.parse(socketUrl);
  //     websocketCubit.connectToUri(uri);
  //   } catch (e) {
  //     log('SocketConnection error ${e.toString()}');
  //   }
  // }

  Future<void> init() async {
    scrollController.addListener(scrollListener);
    await getRooms();
    // await connectSocket();
  }

  void scrollListener() {
    if (roomsCubit.state.paginationLoading || !roomsCubit.state.hasNextPage) {
      return;
    }
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      roomsCubit.loadMoreRooms();
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController
      ..removeListener(scrollListener)
      ..dispose();
    websocketCubit.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => roomsCubit),
        BlocProvider(create: (_) => websocketCubit),
      ],
      child: Material(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              title: Text(appName),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: BlocBuilder<RoomsCubit, RoomsState>(
                builder: (_, state) {
                  return SliverGrid.builder(
                    itemCount: state.data.results.length,
                    itemBuilder: (_, i) {
                      return InkWell(
                        onTap: () => router.push(
                          ChatRoute(
                            room: state.data.results[i],
                          ),
                        ),
                        child: RoomItem(
                          room: state.data.results[i],

                          ///TODO implement this part latter
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
