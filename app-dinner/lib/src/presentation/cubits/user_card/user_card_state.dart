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

class UserCardSaveSuccess extends UserCardState {
  const UserCardSaveSuccess({super.userCard, super.isData});
}

class UserCardSaveFailed extends UserCardState {
  const UserCardSaveFailed({super.error});
}

class UserCardDeleteLoading extends UserCardState {
  const UserCardDeleteLoading({super.isData});
}

class UserCardDeleteSuccess extends UserCardState {
  const UserCardDeleteSuccess({super.isData});
}

class UserCardDeleteFailed extends UserCardState {
  const UserCardDeleteFailed({super.error});
}
