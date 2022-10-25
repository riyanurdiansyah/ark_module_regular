abstract class ArkCategoryRemoteDataSource {
  Future<List<String>> getListIdCourse(int categoryId);

  Future<List<String>> getListIdCourseNewest();
}
