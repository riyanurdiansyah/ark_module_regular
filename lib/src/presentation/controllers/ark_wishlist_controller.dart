import 'package:ark_module_regular/src/core/exception_handling.dart';
import 'package:ark_module_regular/src/data/datasources/remote/ark_home_remote_datasource_impl.dart';
import 'package:ark_module_regular/src/data/datasources/remote/ark_wishlist_remote_datasource_impl.dart';
import 'package:ark_module_regular/src/data/repositories/ark_home_repository_impl.dart';
import 'package:ark_module_regular/src/data/repositories/ark_wishlist_repository_impl.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:ark_module_regular/src/domain/usecases/ark_home_usecase.dart';
import 'package:ark_module_regular/src/domain/usecases/ark_wishlist_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArkWishlistController extends GetxController {
  final ArkWishlistUseCase _useCase = ArkWishlistUseCase(
      ArkWishlistRepositoryImpl(ArkWishlistRemoteDataSourceImpl()));

  final ArkHomeUseCase _useCaseHome =
      ArkHomeUseCase(ArkHomeRepositoryImpl(ArkHomeRemoteDataSourceImpl()));

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<String> _token = ''.obs;
  Rx<String> get token => _token;

  late SharedPreferences _prefs;

  final RxList<CourseParseEntity> _wishlist = <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get wishlist => _wishlist;

  @override
  void onInit() async {
    _setup();
    _getWishlist();
    await _changeLoading(false);
    super.onInit();
  }

  Future _setup() async {
    _prefs = await SharedPreferences.getInstance();
    _token.value = _prefs.getString('token_access') ?? '';
    _getWishlist();
  }

  Future _getWishlist() async {
    _changeLoading(true);
    final response = await _useCase.getAllWishlist(_token.value);

    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _getWishlistDataCourse(data),
    );
    await _changeLoading(false);
  }

  void deleteWishlist(int courseId) async {
    final response = await _useCase.deleteWishlist(courseId, _token.value);
    response.fold(
      (fail) => ExceptionHandle.execute(fail),
      (data) {
        if (data) {
          _wishlist.removeWhere((e) => e.course.id == courseId);
        } else {
          Fluttertoast.showToast(msg: "Gagal menghapus wishlist... coba lagi");
        }
      },
    );
  }

  Future _changeLoading(bool val) async {
    _isLoading.value = val;
  }

  void _getWishlistDataCourse(List<String> listId) async {
    final response = await _useCaseHome.getCourseFromListId(listId);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _wishlist.value = data,
    );
  }
}
