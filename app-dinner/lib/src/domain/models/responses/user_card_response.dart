import 'package:Lopy/src/domain/models/user_card.dart';
import 'package:equatable/equatable.dart';

class UserCardResponse extends Equatable {
  final UserCard userCard;

  const UserCardResponse({
    required this.userCard,
  });

  Map<String, dynamic> toMap() {
    return {
      'userCard': userCard,
    };
  }

  factory UserCardResponse.fromMap(Map<String, dynamic> map) {
    return UserCardResponse(
        userCard: map['data'].map<UserCard>(
              (x) => UserCard.fromJson(x as Map<String, dynamic>),
        ));
  }

  @override
  List<Object> get props => [userCard];
}

class UserCardListResponse extends Equatable {
  final List<UserCard> userCards;

  const UserCardListResponse({
    required this.userCards,
  });

  Map<String, dynamic> toMap() {
    return {
      'userCards': userCards,
    };
  }

  factory UserCardListResponse.fromMap(Map<String, dynamic> map) {
    return UserCardListResponse(
        userCards: List<UserCard>.from(map['data'].map<UserCard>(
      (x) => UserCard.fromJson(x as Map<String, dynamic>),
    )));
  }

  @override
  List<Object> get props => [userCards];
}
