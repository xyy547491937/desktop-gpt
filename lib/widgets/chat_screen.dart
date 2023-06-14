import 'package:flutter/material.dart';
import 'package:flutter_app1/models/message_item.dart';
import 'package:flutter_app1/injection.dart';
import 'package:flutter_app1/states/message_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/message.dart';

final List<Message> messages = [
  Message(content: "Hello", isUser: true, timestamp: DateTime.now()),
  Message(content: "How are you?", isUser: false, timestamp: DateTime.now()),
  Message(
      content: "Fine,Thank you. And you?",
      isUser: true,
      timestamp: DateTime.now()),
  Message(content: "I am fine.", isUser: false, timestamp: DateTime.now()),
];

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = TextEditingController();
    final messages = ref.watch(messageProvider);
    // ignore: no_leading_underscores_for_local_identifiers
    _requestChatGPT(WidgetRef ref, String content) async {
      final res = await chatgpt.sendChat(content);
      final text = res.choices.first.message?.content ?? "";
      final message =
          Message(content: text, isUser: false, timestamp: DateTime.now());
      ref.read(messageProvider.notifier).addMessage(message);
    }

    // 增加WidgetRef
    // ignore: no_leading_underscores_for_local_identifiers
    _sendMessage(WidgetRef ref, String content) {
      _requestChatGPT(ref, content);
    }

    // // ignore: no_leading_underscores_for_local_identifiers
    // _sendMessage(WidgetRef ref, String content) {
    //   final message =
    //       Message(content: content, isUser: true, timestamp: DateTime.now());

    //   ref.read(messageProvider.notifier).addMessage(message); // 添加消息
    //   textController.clear();
    // }

    return Scaffold(
      appBar: AppBar(title: const Text('chat')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return MessageItem(message: messages[index]);
                },
                itemCount: messages.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 16,
                  );
                },
              ),
            ),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  hintText: "type a message",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        _sendMessage(ref, textController.text);
                      }
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
