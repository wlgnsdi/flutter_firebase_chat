import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/chat_page/chat_bubble.dart';
import 'package:flutter_firebase_chat/chat_page/chat_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerWidget {
  final TextEditingController _messageController = TextEditingController();
  final String chattingRoom;
  
  ChatScreen({required this.chattingRoom, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(chatViewmodelProvider(chattingRoom).notifier);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('채팅방'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: viewModel.stremChat(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  var messages = snapshot.data!.docs;

                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var message = messages[index];
                      bool isMe =
                          message['senderId'] == viewModel.currentUser?.uid;

                      return MessageBubble(
                        text: message['text'],
                        isMe: isMe,
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: '메세지를 입력하세요',
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      String message = _messageController.text.trim();
                      if (message.isEmpty) return;
                      viewModel.sendMessage(message);
                      _messageController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
