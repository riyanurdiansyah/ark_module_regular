import 'package:ark_module_regular/ark_module_regular.dart';

abstract class ArkProfileRemoteDataSource {
  Future<ProfileDTO> getProfile(String token);

  Stream<CoinDTO> getCoin(String userId);

  // Future<FaceRecogDTO> getFaceRecog(String token);

  Future<bool> resetPassword(String email, String token);

  Future<List<MyCourseDTO>> getMyCourse(String token);
}
