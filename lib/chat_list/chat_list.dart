import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/chat_list/chat_list_viewmodel.dart';
import 'package:flutter_firebase_chat/chat_page/chat_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ChatListPage extends ConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomsAsync = ref.watch(chatListViewModelProvider);
    final viewModel = ref.read(chatListViewModelProvider.notifier);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showCreateRoomDialog(context, viewModel),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('채팅 방'),
          centerTitle: true,
        ),
        body: chatRoomsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('오류가 발생했습니다: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => viewModel.loadChatRoomList(),
                  child: const Text('다시 시도'),
                ),
              ],
            ),
          ),
          data: (chatRooms) => chatRooms.isEmpty
              ? const Center(
                  child: Text(
                    '채팅방이 없습니다.\n우측 하단의 + 버튼을 눌러 새로운 채팅방을 만들어보세요!',
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.separated(
                  itemCount: chatRooms.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final room = chatRooms[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.chat),
                      ),
                      title: Text(room.roomNo),
                      subtitle: Text(
                        room.lastMessage.isEmpty ? '새로운 채팅방' : room.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        DateFormat('MM/dd HH:mm').format(room.lastMessageTime),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(chattingRoom: room.roomNo),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }

  Future<void> _showCreateRoomDialog(
      BuildContext context, ChatListViewModel viewModel) {
    final controller = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('새로운 채팅방'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: '채팅방 이름',
            hintText: '채팅방 이름을 입력하세요',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                viewModel.createChatRoom(controller.text);
                Navigator.pop(context);
              }
            },
            child: const Text('생성'),
          ),
        ],
      ),
    );
  }
}
