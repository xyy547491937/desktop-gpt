import 'package:openai_api/openai_api.dart';

class ChatGPTService {
  final client = OpenaiClient(
    config: OpenaiConfig(
      apiKey: "sk-7oxgb3md1vibtqiKijjVT3BlbkFJjqyODNrmd6KhTxSzju941", // 你的key
      baseUrl:
          "https://openai.mignsin.workers.dev/v1", // 如果有自建OpenAI服务请设置这里，如果你自己的代理服务器不太稳定，这里可以配置为 https://openai.mignsin.workers.dev/v1
      httpProxy:
          "http://127.0.0.1:9910", // 代理服务地址，比如 clashx，你可以使用 http://127.0.0.1:7890
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
}
