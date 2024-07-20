import 'package:Lopy/src/domain/models/cart.dart';
import 'package:floor/floor.dart';
import '../../../../utils/constants/strings.dart';


@dao
abstract class CartDao {
  // @Query('SELECT * FROM $cartTable')
  @Query('SELECT * FROM $cartTable WHERE userId = :userId')
  Future<List<Cart>> getCartItems(int userId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCartItem(Cart cart);

  @delete
  Future<void> deleteCartItem(Cart cart);

  @Query('UPDATE $cartTable SET quantity = quantity + 1 WHERE itemId = :itemId')
  Future<void> incrementCartItemQuantity(int itemId);

  @Query('UPDATE $cartTable SET quantity = quantity - 1 WHERE itemId = :itemId AND quantity > 0')
  Future<void> decrementCartItemQuantity(int itemId);

  // @Query('DELETE FROM $cartTable WHERE restaurantId = :restaurantId')
  @Query('DELETE FROM $cartTable WHERE restaurantId = :restaurantId AND userId = :userId')
  Future<void> clearCart(int restaurantId, int userId);
}
