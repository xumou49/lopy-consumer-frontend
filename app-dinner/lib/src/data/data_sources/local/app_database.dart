import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/models/cart.dart';
import 'dao/cart_dao.dart';
// import 'converters/source_type_converter.dart';

part 'app_database.g.dart';

// @TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [Cart])
abstract class AppDatabase extends FloorDatabase {
  CartDao get cartDao;
}