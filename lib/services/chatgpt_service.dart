import 'package:flutter_app1/injection.dart';
import 'package:logger/logger.dart';
import 'package:openai_api/openai_api.dart';

import '../env.dart';

class ChatGPTService {
  final client = OpenaiClient(
    config: OpenaiConfig(
      apiKey: Env.apiKey,
      baseUrl: Env.baseUrl,
      httpProxy: Env.httpProxy, // 代理服务地址，比如 clashx，你可以使用 http://127.0.0.1:7890
    ),
  );
  Future<ChatCompletionResponse> sendChat(String content) async {
    final request = ChatCompletionRequest(model: Model.gpt3_5Turbo, messages: [
      ChatMessage(
        content: content,
        role: ChatMessageRole.user,
      )
    ]);
    return await client.sendChatCompletion(request);
  }

  Future streamChat(
    String content, {
    Function(String text)? onSuccess,
  }) async {
    final request = ChatCompletionRequest(
        model: Model.gpt3_5Turbo,
        stream: true,
        messages: [
          ChatMessage(
            content: content,
            role: ChatMessageRole.user,
          )
        ]);
    return await client.sendChatCompletionStream(
      request,
      onSuccess: (p0) {
        final text = p0.choices.first.delta?.content;
        logger.d(p0);
        if (text != null) {
          onSuccess?.call(text);
        }
      },
    );
  }
}
