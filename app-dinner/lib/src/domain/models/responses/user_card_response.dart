import 'package:Lopy/src/domain/models/user_card.dart';
import 'package:equatable/equatable.dart';

class UserCardResponse extends Equatable {
  final UserCard userCard;

  const UserCardResponse({
    required this.userCard,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': userCard,
    };
  }

  factory UserCardResponse.fromMap(Map<String, dynamic> map) {
    // return UserCardResponse(
    //     userCard: UserCard.fromJson(map["data"] as Map<String, dynamic>));

    return const UserCardResponse(
        userCard: UserCard());
  }

  @override
  List<Object> get props => [userCard];
}
