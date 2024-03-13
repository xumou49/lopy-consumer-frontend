part of 'user_card_cubit.dart';

abstract class UserCardState extends Equatable {
  final UserCard userCard;
  final bool isData;
  final DioError? error;

  const UserCardState({
    this.userCard = const UserCard(),
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [userCard, isData, error];
}

class UserCardLoading extends UserCardState {
  const UserCardLoading();
}

class UserCardSuccess extends UserCardState {
  const UserCardSuccess({super.userCard, super.isData});
}

class UserCardFailed extends UserCardState {
  const UserCardFailed({super.error});
}
