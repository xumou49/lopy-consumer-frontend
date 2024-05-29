part of "user_card_list_cubit.dart";

abstract class UserCardListState extends Equatable {
  final List<UserCard> userCards;
  final bool isData;
  final DioError? error;

  const UserCardListState({
    this.userCards = const [],
    this.isData = true,
    this.error,
  });

  @override
  List<Object> get props => [userCards, isData];
}

class UserCardListLoading extends UserCardListState {
  const UserCardListLoading();
}

class UserCardListSuccess extends UserCardListState {
  const UserCardListSuccess({super.userCards, super.isData, super.error});
}

class UserCardListFailed extends UserCardListState {
  const UserCardListFailed({super.error});
}
