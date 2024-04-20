import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'userCardTable')
class UserCard extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? stripeId;
  final String? brand;
  final int? userId;
  final String? funding;
  final String? lastFour;
  final int? expMonth;
  final int? expYear;
  final String? country;
  final String? cvcCheck;
  final String? fingerprint;

  const UserCard({
    this.id,
    this.stripeId,
    this.brand,
    this.userId,
    this.funding,
    this.lastFour,
    this.expMonth,
    this.expYear,
    this.country,
    this.cvcCheck,
    this.fingerprint,
  });

  @override
  List<Object?> get props => [
        id,
        stripeId,
        brand,
        lastFour,
        expMonth,
        expYear,
        country,
        cvcCheck,
        fingerprint
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stripeId': stripeId,
      'brand': brand,
      'userId': userId,
      'funding': funding,
      'lastFour': lastFour,
      'expMonth': expMonth,
      'expYear': expYear,
      'country': country,
      'cvcCheck': cvcCheck,
      'fingerprint': fingerprint
    };
  }

  factory UserCard.fromMap(Map<String, dynamic> map) {
    return UserCard(
      id: map['id'] as int,
      stripeId: map['stripeId'] as String,
      brand: map['brand'] as String,
      userId: map['userId'] as int,
      funding: map['funding'] as String,
      lastFour: map['lastFour'] as String,
      expMonth: map['expMonth'] as int,
      expYear: map['expYear'] as int,
      country: map['country'] as String,
      cvcCheck: map['cvcCheck'] as String,
      fingerprint: map['fingerprint'] as String,
    );
  }

  factory UserCard.fromJson(Map<String, dynamic> json) {
    return UserCard(
      id: json['id'],
      stripeId: json['stripeId'],
      brand: json['brand'],
      userId: json['userId'],
      funding: json['funding'],
      lastFour: json['lastFour'],
      expMonth: json['expMonth'],
      expYear: json['expYear'],
      country: json['country'],
      cvcCheck: json['cvcCheck'],
      fingerprint: json['fingerprint'],
    );
  }
}
