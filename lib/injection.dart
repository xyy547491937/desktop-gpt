import 'package:uuid/uuid.dart';
import 'package:logger/logger.dart';
import 'data/database.dart';
import 'services/chatgpt_service.dart';

const uuid = Uuid();
var logger = Logger();

final chatgpt = ChatGPTService();
// 定义数据库类
late AppDatabase db;
