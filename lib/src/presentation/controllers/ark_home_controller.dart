import 'package:ark_module_regular/src/data/datasources/remote/ark_home_remote_datasource_impl.dart';
import 'package:ark_module_regular/src/data/repositories/ark_home_repository_impl.dart';
import 'package:ark_module_regular/src/domain/entities/category_entity.dart';
import 'package:ark_module_regular/src/domain/entities/slider_entity.dart';
import 'package:ark_module_regular/src/domain/usecases/ark_home_usecase.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';

class ArkHomeController extends GetxController {
  final ArkHomeUseCase _useCase =
      ArkHomeUseCase(ArkHomeRepositoryImpl(ArkHomeRemoteDataSourceImpl()));

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<bool> _isLoadingCategory = true.obs;
  Rx<bool> get isLoadingCategory => _isLoadingCategory;

  final Rx<bool> _isLoadingImageSlider = true.obs;
  Rx<bool> get isLoadingImageSlider => _isLoadingImageSlider;

  final Rx<int> _selectedCategoryIndex = 0.obs;
  Rx<int> get selectedCategoryIndex => _selectedCategoryIndex;

  final Rx<int> _indexSlider = 0.obs;
  Rx<int> get indexSlider => _indexSlider;

  final Rx<CategoryEntity> _category = const CategoryEntity(
    status: false,
    data: [],
  ).obs;
  Rx<CategoryEntity> get category => _category;

  final Rx<SliderEntity> _sliderImage =
      SliderEntity(success: false, data: []).obs;

  Rx<SliderEntity> get sliderImage => _sliderImage;

  @override
  void onInit() async {
    _getCategory();
    _getImageSlider();
    await _changeLoading(false);
    super.onInit();
  }

  Future _changeLoading(bool val) async {
    _isLoading.value = val;
  }

  Future _changeLoadingCategory(bool val) async {
    _isLoadingCategory.value = val;
  }

  Future _changeLoadingImageSlider(bool val) async {
    _isLoadingImageSlider.value = val;
  }

  void _getCategory() async {
    _changeLoadingCategory(true);
    final response = await _useCase.getCategory();
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail), (data) {
      _category.value = data;
    });
    await _changeLoadingCategory(false);
  }

  void _getImageSlider() async {
    _changeLoadingImageSlider(true);
    final response = await _useCase.getImageSlider();
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) {
        _sliderImage.value = data;
      },
    );
    await _changeLoadingImageSlider(false);
  }

  void onSliderChange(int i, CarouselPageChangedReason r) {
    _indexSlider.value = i;
  }
}
