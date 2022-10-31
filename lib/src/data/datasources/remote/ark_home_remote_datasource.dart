import 'package:ark_module_setup/ark_module_setup.dart';

abstract class ArkHomeRemoteDataSource {
  Future<CategoryDTO> getCategory();

  Future<SliderDTO> getImageSlider();

  Future<CourseDTO> getCourseJRC();

  Future<List<String>> getListIdTrendingCourse();

  Future<List<CourseParseDTO>> getCourseFromListId(List<String> listId);

  Future<List<String>> getListIdNewestCourse();

  Future<List<String>> getListIdCourseByKategori(String urlKategori);

  Future<List<BlogDTO>> getBlogs(int page);

  Future<bool> postGameBase(String email, String cardbase);
}
