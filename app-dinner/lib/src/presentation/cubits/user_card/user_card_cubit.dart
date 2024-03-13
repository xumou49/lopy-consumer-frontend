import 'package:Lopy/src/domain/models/requests/user_card_request.dart';
import 'package:Lopy/src/domain/models/user_card.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/api_repository.dart';

part 'user_card_state.dart';

class UserCardCubit extends BaseCubit<UserCardState, UserCard> {
  final ApiRepository _apiRepository;

  UserCardCubit(this._apiRepository)
      : super(const UserCardLoading(), const UserCard());

  Future<void> saveUserCard(String token) async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.saveUserCard(
          request: UserCardRequest(token: token));
      print(response.toString());
      if (response is DataSuccess) {
        final userCard = response.data!.userCard;
        emit(UserCardSuccess(
            userCard: userCard, isData: userCard != null));
      } else if (response is DataFailed) {
        emit(UserCardFailed(error: response.error));
      }
    });
  }
}
