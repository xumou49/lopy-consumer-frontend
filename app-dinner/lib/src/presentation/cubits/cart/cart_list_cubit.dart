import 'package:Lopy/src/domain/models/cart.dart';
import 'package:Lopy/src/domain/repositories/database_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../domain/repositories/auth_repository.dart';


part 'cart_list_state.dart';

class CartListCubit
    extends BaseCubit<CartListState, List<Cart>> {
  final DatabaseRepository _databaseRepository;
  final AuthRepository _authRepository;

  CartListCubit(this._databaseRepository, this._authRepository)
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
    String? token = await _authRepository.getToken();
    print(token);
    Map<String, dynamic> decodedToken;
    decodedToken = JwtDecoder.decode(token!);
    print(decodedToken);
    Cart c = Cart(
      name: cartItem.name,
      quantity: cartItem.quantity,
      price: cartItem.price,
      userId: int.tryParse(decodedToken['id'])!,
      restaurantId: cartItem.restaurantId,
      // restaurantId: 10,
      restaurantMenuItemId:cartItem.restaurantMenuItemId,
    );
    await _databaseRepository.insertCartItem(c);
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
    String? token = await _authRepository.getToken();
    print(token);
    Map<String, dynamic> decodedToken;
    decodedToken = JwtDecoder.decode(token!);
    final cartItems = await _databaseRepository.getCartItems(int.tryParse(decodedToken['id'])!);
    return CartListSuccess(cartItems: cartItems);
  }

  Future<void> clearCart(int restaurantId) async {
    String? token = await _authRepository.getToken();
    print(token);
    Map<String, dynamic> decodedToken;
    decodedToken = JwtDecoder.decode(token!);
    await _databaseRepository.clearCart(restaurantId, int.tryParse(decodedToken['id'])!);
    emit(await _getAllSavedCarts());
  }

}
