import 'package:Lopy/src/domain/models/requests/user_card_request.dart';
import 'package:Lopy/src/domain/models/user_card.dart';
import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/api_repository.dart';

part 'user_card_list_state.dart';

class UserCardListCubit extends BaseCubit<UserCardListState, UserCard> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  UserCardListCubit(this._apiRepository, this._authRepository)
      : super(const UserCardListLoading(), const UserCard());

  Future<void> getUserCardList(String brand) async {
    if (isBusy) return;

    await run(() async {
      String? token = await _authRepository.getToken();
      final response = await _apiRepository.getUserCardList(
          token: token!, request: UserCardListRequest(brand: brand));
      if (response is DataSuccess) {
        emit(UserCardListSuccess(
            userCards: response.data!.userCards, isData: true));
      } else if (response is DataFailed) {
        emit(UserCardListFailed(error: response.error));
      }
    });
  }
}
