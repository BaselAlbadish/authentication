import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../error/exceptions.dart';

abstract class LocalDataSource {
  bool containsKey(String key);

  get(String key);

  Future<dynamic> getList(String key);

  Future<Unit> cacheValue(String key, String? value);

  Future<Unit> cacheList(String key, List<String> value);

  Future<bool> removeValue(String key);

  List<String> toListForCash<T>(List<T> model) {
    List<String> cashList = [];
    for (T element in model) {
      final item = jsonEncode(element);
      cashList.add(item);
    }
    return cashList;
  }

  String toValueForCash<T>(T model) {
    return jsonEncode(model);
  }

  T convertToObjectFromLocal<T>(
      String value, T Function(Map<String, dynamic>) fromJson) {
    Map<String, dynamic> objectMap = {};
    objectMap = jsonDecode(value) as Map<String, dynamic>;
    final T object = fromJson(objectMap);
    return object;
  }

  List<T> convertToListOfObjectFromLocal<T>(List<String> list, T Function(Map<String, dynamic>) fromJson) {
    List<T> objectList = [];
    Map<String, dynamic> objectMap = {};
    for (String item in list) {
      objectMap = jsonDecode(item) as Map<String, dynamic>;
      final T object = fromJson(objectMap);
      objectList.add(object);
    }
    return objectList;
  }

  Future<Unit> addToCashList<T>(String key, T object) async {
    List<String> cashList = await getList(key);
    cashList.add(toValueForCash(object));
    //TODO
    await cacheList(key, cashList);
    return unit;
  }

  Future<Unit> deleteFromCashList<T>(String key, T object) async {
    List<String> cashList = await getList(key);
    cashList.remove(toValueForCash(object));
    //TODO
    await cacheList(key, cashList);
    return unit;
  }

  Future<Unit> updateCashList<T>(String key,
      {required T oldObject, required T newObject}) async {
    List<String> cashList = await getList(key);
    String old = toValueForCash(oldObject);
    int index = cashList.indexOf(old);
    cashList.remove(old);
    String news = toValueForCash(newObject);
    cashList.insert(index, news);
    //TODO
    await cacheList(key, cashList);
    return unit;
  }
}

class LocalDataSourceSharedPreferences extends LocalDataSource {
  SharedPreferences sharedPreferences;

  LocalDataSourceSharedPreferences(this.sharedPreferences);

  @override
  Future<Unit> cacheValue(String key, String? value) async {
    if(value != null){
      bool done = await sharedPreferences.setString(key, value);
      if (!done) {
        throw CacheException();
      }
    }
    return unit;
  }

  @override
   get(String key) {
    final result = sharedPreferences.get(key);
    if (result == null) {
      return null;
    } else {
      return result;
    }
  }

  @override
  Future<Unit> cacheList(String key, List<String> value) async {
    bool done = await sharedPreferences.setStringList(key, value);
    if (!done) {
      throw CacheException();
    }
    return unit;
  }

  @override
  Future getList(String key) async {
    final result = sharedPreferences.getStringList(key);
    if (result == null) {
      throw CacheException();
    } else {
      return result;
    }
  }

  @override
  Future<bool> removeValue(String key) async {
    final result = await sharedPreferences.remove(key);
    if (result) {
      return true;
    } else {
      return false;
    }
  }

  @override
  bool containsKey(String key) {
    return sharedPreferences.containsKey(key);
  }
}
