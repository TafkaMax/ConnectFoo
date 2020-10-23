abstract class ITodoCategoryService<TodoCategory> {
  Future<TodoCategory> getAll<TodoCategory>(String jwt);

  Future<TodoCategory> getById<TodoCategory>(String id, String jwt);

  Future<TodoCategory> addObject<TodoCategory>(TodoCategory object, String jwt);

  Future<TodoCategory> deleteObject<TodoCategory>(String id, String jwt);

  Future<TodoCategory> updateObject<TodoCategory>(
      TodoCategory object, String jwt);
}
