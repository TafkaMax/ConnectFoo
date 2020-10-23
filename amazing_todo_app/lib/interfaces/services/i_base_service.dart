abstract class IBaseService<T> {
  Future<T> getAll(String jwt);

  Future<T> getById(String id, String jwt);

  Future<T> addObject(T object, String jwt);

  Future<T> deleteObject(String id, String jwt);

  Future<T> updateObject(T object, String jwt);
}
