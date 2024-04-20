import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'userTable')
class User extends Equatable {
  @PrimaryKey()
  final int id;
  final String email;
  final String type;
  final int loginPlatform;
  final String locale;

  const User(
      {required this.id,
      required this.email,
      required this.type,
      required this.loginPlatform,
      required this.locale});

  @override
  List<Object?> get props => [id, email, type];
}
