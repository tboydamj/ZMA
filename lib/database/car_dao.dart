import 'package:sembast/sembast.dart';
import 'app_database.dart';
import 'car_model.dart';

class CarDao{
  static const String CAR_STORE_NAME = 'cars';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _carStore = intMapStoreFactory.store(CAR_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Car car) async {
    await _carStore.add(await _db, car.toMap());
    print(car.toMap());
  }

  Future update(Car car) async{
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a finder.
    final finder = Finder(filter: Filter.byKey(car.id));
    await _carStore.update(
      await _db,
      car.toMap(),
      finder: finder,
    );
  }

  Future delete(Car car) async{
    final finder = Finder(filter: Filter.byKey(car.id));
    await _carStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Car>> getAllSortedByRegNum() async{
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('regNum'),
    ]);

    final recordSnapshots = await _carStore.find(
        await _db,
        finder: finder
    );
    return recordSnapshots.map((snapshot) {
      final car = Car.fromMap(snapshot.value);
      car.id = snapshot.key;
      return car;
    }).toList();

  }

// Making a List<Car> out of List<RecordSnapshot>



}