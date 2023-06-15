import 'package:uuid/uuid.dart';
import 'package:logger/logger.dart';
import 'services/chatgpt_service.dart';

const uuid = Uuid();
var logger = Logger();

final chatgpt = ChatGPTService();
