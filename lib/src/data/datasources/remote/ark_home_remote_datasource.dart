import 'package:ark_module_regular/src/data/dto/category_dto.dart';

abstract class ArkHomeRemoteDataSource {
  Future<CategoryDTO> getCategory();
}
