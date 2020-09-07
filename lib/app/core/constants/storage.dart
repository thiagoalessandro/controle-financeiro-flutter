import 'package:get_storage/get_storage.dart';

class Storage {

  static String CONTAINER_NAME = 'preferenceApp';
  static GetStorage STORAGE_CUSTOM = GetStorage(CONTAINER_NAME);

  const Storage();

  init() async {
    await GetStorage.init(CONTAINER_NAME);
  }

  get<T>(String key) {
    return STORAGE_CUSTOM.read(key) as T;
  }

  set(String key, dynamic value) {
    return STORAGE_CUSTOM.write(key, value);
  }

}
// ignore: non_constant_identifier_names
const StorageCustom = Storage();
