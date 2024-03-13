part of 'cart_list_cubit.dart';

abstract class CartListState extends Equatable {
  final List<Cart> cartItems;
  final bool isData;
  final DioError? error;

  const CartListState({
    this.cartItems = const [],
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [cartItems, isData, error];
}

class CartListLoading extends CartListState {
  const CartListLoading();
}

class CartListSuccess extends CartListState {
  const CartListSuccess({super.cartItems, super.isData});
}

class CartListFailed extends CartListState {
  const CartListFailed({super.error});
}
