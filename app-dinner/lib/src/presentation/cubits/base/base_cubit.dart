import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S, T> extends Cubit<S> {
  BaseCubit(S initialState, this._data) : super(initialState);

  final T _data;

  @protected
  T get data => _data;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  @protected
  Future<void> run(Future<void> Function() process) async {
    try {
      if (!_isBusy) {
        _isBusy = true;
        await process();
      }
    } catch (e) {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print("exception raise when doing api call: $e");
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    } finally {
      _isBusy = false;
    }
  }
}
