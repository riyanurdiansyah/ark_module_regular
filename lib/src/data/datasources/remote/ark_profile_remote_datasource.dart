import 'package:ark_module_setup/ark_module_setup.dart';

abstract class ArkProfileRemoteDataSource {
  Future<ProfileDTO> getProfile(String token);

  Stream<CoinDTO> getCoin(String userId);

  Future<FaceRecogDTO> getFaceRecog(String token);

  Future<SertifikatDTO> getAllCertificate(String userId);

  Future<bool> resetPassword(String email, String token);

  Future<ProvinsiDTO> getProvinsi();

  Future<CityDTO> getCity(int id);

  Future<bool> updateProfile(ProfileDataEntity profile, String token);

  Future<bool> updateCoin(String id, Map<String, dynamic> data);

  Future<bool> updateProfilePrakerja(
      String token, Map<String, Map<String, Object>> data);
}
