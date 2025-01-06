import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/chat_list/chat_list_viewmodel.dart';
import 'package:flutter_firebase_chat/chat_page/chat_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListPage extends ConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomList = ref.watch(chatListViewMdoelProvider);
    final viewModel = ref.read(chatListViewMdoelProvider.notifier);

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chattingRoom: ''),
                ),
              ).then((value) {
                viewModel.loadChatRoomList();
              });
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text('채팅 방'),
            centerTitle: true,
          ),
          body: viewModel.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: chatRoomList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Chat Room $index'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(chattingRoom: chatRoomList[index]),
                          ),
                        );
                      },
                    );
                  },
                )),
    );
  }
}
