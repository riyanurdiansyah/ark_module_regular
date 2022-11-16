import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/data/dto/course_dto.dart';

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
