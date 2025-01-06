import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/chat_list/chat_list.dart';
import 'package:flutter_firebase_chat/login_page/login_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(loginViewmodelProvider.notifier);
    final user = ref.watch(loginViewmodelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: user != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: viewModel.signOut,
                      child:
                          Text('로그아웃', style: TextStyle(fontSize: 20, color: Colors.red))),
                  TextButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatListPage()));
                      },
                      child: Text('채팅 하기', style: TextStyle(fontSize: 20, color: Colors.blue))),
                ],
              ),
            )
          : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              TextButton(
                onPressed: () async {
                  viewModel.signInWithEmail(
                      emailController.text, passwordController.text);
                },
                child: Text('로그인', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
    );
  }
}
