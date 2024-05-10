import 'package:Lopy/src/domain/models/requests/user_card_request.dart';
import 'package:Lopy/src/domain/models/user_card.dart';
import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/api_repository.dart';

part 'user_card_state.dart';

class UserCardCubit extends BaseCubit<UserCardState, UserCard> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  UserCardCubit(this._apiRepository, this._authRepository)
      : super(const UserCardLoading(), const UserCard());

  Future<void> saveUserCard(String cardToken) async {
    if (isBusy) return;

    await run(() async {
      String? token = await _authRepository.getToken();
      final response = await _apiRepository.saveUserCard(
          token: token!, request: UserCardRequest(cardToken: cardToken));
      if (response is DataSuccess) {
        emit(UserCardSuccess(isData: true));
      } else if (response is DataFailed) {
        emit(UserCardFailed(error: response.error));
      }
    });
  }
}
