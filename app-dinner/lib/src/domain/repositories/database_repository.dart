import '../../domain/models/cart.dart';

abstract class DatabaseRepository {
  Future<List<Cart>> getCartItems();

  Future<void> insertCartItem(Cart cart);

  Future<void> deleteCartItem(Cart cart);

  Future<void> incrementCartItemQuantity(int itemId);

  Future<void> decrementCartItemQuantity(int itemId);

  Future<void> clearCart(int restaurantId);
}