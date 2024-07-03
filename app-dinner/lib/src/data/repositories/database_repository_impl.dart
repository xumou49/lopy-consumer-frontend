import '../../domain/models/cart.dart';
import '../../domain/repositories/database_repository.dart';
import '../data_sources/local/app_database.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Cart>> getCartItems(int userId) async {
    return _appDatabase.cartDao.getCartItems(userId);
  }

  @override
  Future<void> deleteCartItem(Cart cart) async {
    return _appDatabase.cartDao.deleteCartItem(cart);
  }

  @override
  Future<void> insertCartItem(Cart cart) async {
    return _appDatabase.cartDao.insertCartItem(cart);
  }

  @override
  Future<void> incrementCartItemQuantity(int itemId) async {
    return _appDatabase.cartDao.incrementCartItemQuantity(itemId);
  }

  @override
  Future<void> decrementCartItemQuantity(int itemId) async {
    return _appDatabase.cartDao.decrementCartItemQuantity(itemId);
  }

  @override
  Future<void> clearCart(int restaurantId, int userId) async {
    return _appDatabase.cartDao.clearCart(restaurantId, userId);
  }

}