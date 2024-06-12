part of 'history_keyword_list_cubit.dart';

abstract class HistoryKeywordListState extends Equatable {
  final List<String> historyKeywords;
  final bool isData;
  final DioError? error;

  const HistoryKeywordListState({
    this.historyKeywords = const [],
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [historyKeywords, isData, error];
}

class HistoryKeywordListLoading extends HistoryKeywordListState {
  const HistoryKeywordListLoading();
}

class HistoryKeywordListSuccess extends HistoryKeywordListState {
  const HistoryKeywordListSuccess({super.historyKeywords, super.isData});
}

class HistoryKeywordListFailed extends HistoryKeywordListState {
  const HistoryKeywordListFailed({super.error});
}
