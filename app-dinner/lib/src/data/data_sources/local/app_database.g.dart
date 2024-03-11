// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CartDao? _cartDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cartTable` (`itemId` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `quantity` INTEGER NOT NULL, `price` REAL NOT NULL, `userId` INTEGER NOT NULL, `restaurantId` INTEGER NOT NULL, `restaurantMenuItemId` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CartDao get cartDao {
    return _cartDaoInstance ??= _$CartDao(database, changeListener);
  }
}

class _$CartDao extends CartDao {
  _$CartDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cartInsertionAdapter = InsertionAdapter(
            database,
            'cartTable',
            (Cart item) => <String, Object?>{
                  'itemId': item.itemId,
                  'name': item.name,
                  'quantity': item.quantity,
                  'price': item.price,
                  'userId': item.userId,
                  'restaurantId': item.restaurantId,
                  'restaurantMenuItemId': item.restaurantMenuItemId
                }),
        _cartDeletionAdapter = DeletionAdapter(
            database,
            'cartTable',
            ['itemId'],
            (Cart item) => <String, Object?>{
                  'itemId': item.itemId,
                  'name': item.name,
                  'quantity': item.quantity,
                  'price': item.price,
                  'userId': item.userId,
                  'restaurantId': item.restaurantId,
                  'restaurantMenuItemId': item.restaurantMenuItemId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Cart> _cartInsertionAdapter;

  final DeletionAdapter<Cart> _cartDeletionAdapter;

  @override
  Future<List<Cart>> getCartItems() async {
    return _queryAdapter.queryList('SELECT * FROM cartTable',
        mapper: (Map<String, Object?> row) => Cart(
            itemId: row['itemId'] as int?,
            name: row['name'] as String,
            quantity: row['quantity'] as int,
            price: row['price'] as double,
            userId: row['userId'] as int,
            restaurantId: row['restaurantId'] as int,
            restaurantMenuItemId: row['restaurantMenuItemId'] as int));
  }

  @override
  Future<void> incrementCartItemQuantity(int itemId) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE cartTable SET quantity = quantity + 1 WHERE itemId = ?1',
        arguments: [itemId]);
  }

  @override
  Future<void> decrementCartItemQuantity(int itemId) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE cartTable SET quantity = quantity - 1 WHERE itemId = ?1 AND quantity > 0',
        arguments: [itemId]);
  }

  @override
  Future<void> clearCart(
    int userId,
    int restaurantId,
  ) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM cartTable WHERE userId = ?1 AND restaurantId = ?2',
        arguments: [userId, restaurantId]);
  }

  @override
  Future<void> insertCartItem(Cart cart) async {
    await _cartInsertionAdapter.insert(cart, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCartItem(Cart cart) async {
    await _cartDeletionAdapter.delete(cart);
  }
}
