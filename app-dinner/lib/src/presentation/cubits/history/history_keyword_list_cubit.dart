import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/api_repository.dart';
import '../../../utils/resources/data_state.dart';

part 'history_keyword_list_state.dart';

class HistoryKeywordListCubit
    extends BaseCubit<HistoryKeywordListState, List<String>> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  HistoryKeywordListCubit(this._apiRepository, this._authRepository)
      : super(const HistoryKeywordListLoading(), []);

  Future<void> getHistoryKeywordList() async {
    if (isBusy) return;
    await run(() async {
      String? token = await _authRepository.getToken();
      final response =
          await _apiRepository.getHistoryKeywordList(token: token!);
      if (response is DataSuccess) {
        final historyKeywords = response.data!.historyKeywords;
        emit(HistoryKeywordListSuccess(
            historyKeywords: historyKeywords, isData: true));
      } else if (response is DataFailed) {
        emit(HistoryKeywordListFailed(error: response.error));
      }
    });
  }

  // void refreshHistoryKeywordList() {
  //   emit(HistoryKeywordListSuccess(
  //       historyKeywords: _cacheKeywords, isData: true));
  // }
}
