import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_app1/data/dao/session_dao.dart';
import 'package:flutter_app1/models/session.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/message.dart';
import 'converter/datetime_converter.dart';
import 'dao/message_dao.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Message, Session])
@TypeConverters([DateTimeConverter])
abstract class AppDatabase extends FloorDatabase {
  MessageDao get messageDao;
  SessionDao get sessionDao;
}
