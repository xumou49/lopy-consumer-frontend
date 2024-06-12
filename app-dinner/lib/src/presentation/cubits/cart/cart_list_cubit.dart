import 'package:Lopy/src/domain/models/cart.dart';
import 'package:Lopy/src/domain/repositories/database_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';


part 'cart_list_state.dart';

class CartListCubit
    extends BaseCubit<CartListState, List<Cart>> {
  final DatabaseRepository _databaseRepository;

  CartListCubit(this._databaseRepository)
      : super(const CartListLoading(), []);

  final int _page = 1;

  Future<void> getAllSavedCarts() async {
    emit(await _getAllSavedCarts());
  }

  Future<void> removeCart({required Cart cartItem}) async {
    await _databaseRepository.deleteCartItem(cartItem);
    emit(await _getAllSavedCarts());
  }

  Future<void> saveCart({required Cart cartItem}) async {
    await _databaseRepository.insertCartItem(cartItem);
    emit(await _getAllSavedCarts());
  }

  Future<void> incrementCartItemQuantity({required Cart cartItem}) async {
    // Call the repository to increment quantity
    if (cartItem.itemId != null) {
      int itemId = cartItem.itemId!;
      await _databaseRepository.incrementCartItemQuantity(itemId);
      emit(await _getAllSavedCarts());
    }
  }

  Future<void> decrementCartItemQuantity({required Cart cartItem}) async {
    // Call the repository to decrement quantity
    if (cartItem.itemId != null) {
      int itemId = cartItem.itemId!;
      await _databaseRepository.decrementCartItemQuantity(itemId);
      emit(await _getAllSavedCarts());
    }
  }

  Future<CartListState> _getAllSavedCarts() async {
    final cartItems = await _databaseRepository.getCartItems();
    return CartListSuccess(cartItems: cartItems);
  }

  Future<void> clearCart(int restaurantId) async {
    await _databaseRepository.clearCart(restaurantId);
    emit(await _getAllSavedCarts());
  }

}
