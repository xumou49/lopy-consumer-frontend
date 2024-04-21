part of "order_place_cubit.dart";

abstract class OrderPlaceState extends Equatable {
  final String uid;
  final bool isData;
  final DioError? error;

  const OrderPlaceState({this.uid = "", this.isData = true, this.error});

  @override
  List<Object?> get props => [uid, isData, error];
}

class OrderPlaceLoading extends OrderPlaceState {
  const OrderPlaceLoading();
}

class OrderPlaceSuccess extends OrderPlaceState {
  const OrderPlaceSuccess({super.uid, super.isData, super.error});
}

class OrderPlaceFailed extends OrderPlaceState {
  const OrderPlaceFailed({super.error});
}
