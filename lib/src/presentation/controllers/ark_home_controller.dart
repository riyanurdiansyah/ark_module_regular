import 'package:ark_module_regular/src/data/datasources/remote/ark_home_remote_datasource_impl.dart';
import 'package:ark_module_regular/src/data/repositories/ark_home_repository_impl.dart';
import 'package:ark_module_regular/src/domain/entities/category_entity.dart';
import 'package:ark_module_regular/src/domain/usecases/ark_home_usecase.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:get/get.dart';

class ArkHomeController extends GetxController {
  final ArkHomeUseCase _useCase =
      ArkHomeUseCase(ArkHomeRepositoryImpl(ArkHomeRemoteDataSourceImpl()));

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<int> _selectedCategoryIndex = 0.obs;
  Rx<int> get selectedCategoryIndex => _selectedCategoryIndex;

  final Rx<CategoryEntity> _category = const CategoryEntity(
    status: false,
    data: [],
  ).obs;
  Rx<CategoryEntity> get category => _category;

  @override
  void onInit() async {
    await _getCategory();
    await _changeLoading(false);
    super.onInit();
  }

  Future _changeLoading(bool val) async {
    _isLoading.value = val;
  }

  Future _getCategory() async {
    final response = await _useCase.getCategory();
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail), (data) {
      _category.value = data;
    });
  }
}
