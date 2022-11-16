// import 'dart:developer';
// import 'package:ark_module_regular/ark_module_regular.dart';
// import 'package:ark_module_regular/utils/app_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ark_module_regular/utils/app_route_name.dart';
// import 'package:ark_module_regular/utils/app_url.dart';

// class ArkProfileController extends GetxController {
//   final ArkProfileUseCase _useCase = ArkProfileUseCase(
//       ArkProfileRepositoryImpl(ArkProfileRemoteDataSourceImpl()));

//   @override
//   void onClose() {
//     log('ARK PROFILE CONTROLLER CLOSE');
//     super.onClose();
//   }

//   @override
//   void onInit() async {
//     log('ARK PROFILE CONTROLLER INIT');
//     await _setup();
//     if (_isLogin.value) {
//       await getProfile();
//       getMyCourse();
//       // _getFaceRecog();
//     }
//     await _changeLoading(false);
//     super.onInit();
//   }

//   final _googleSignIn = GoogleSignIn();
//   final _googleSignInIos = GoogleSignIn(
//     hostedDomain: baseUrl,
//     clientId:
//         '265001851813-uvseu68037o8lpo126p679sbm3sesns6.apps.googleusercontent.com',
//   );

//   late SharedPreferences prefs;

//   final Rx<bool> _isLogin = false.obs;
//   Rx<bool> get isLogin => _isLogin;

//   final Rx<String> _token = ''.obs;
//   Rx<String> get token => _token;

//   final Rx<String> _tokenWP = ''.obs;
//   Rx<String> get tokenWP => _tokenWP;

//   final Rx<String> _tokenPrakerja = ''.obs;
//   Rx<String> get tokenPrakerja => _tokenPrakerja;

//   final Rx<String> _userId = ''.obs;
//   Rx<String> get userId => _userId;

//   final Rx<String> _avatar = ''.obs;
//   Rx<String> get avatar => _avatar;

//   final Rx<String> _name = ''.obs;
//   Rx<String> get name => _name;

//   final Rx<String> _email = ''.obs;
//   Rx<String> get email => _email;

//   final Rx<String> _noHp = ''.obs;
//   Rx<String> get noHp => _noHp;

//   final Rx<String> _tanggalLahir = ''.obs;
//   Rx<String> get tanggalLahir => _tanggalLahir;

//   final Rx<String> _provinsiName = ''.obs;
//   Rx<String> get provinsiName => _provinsiName;

//   final Rx<String> _pendidikan = ''.obs;
//   Rx<String> get pendidikan => _pendidikan;

//   final Rx<String> _gender = ''.obs;
//   Rx<String> get gender => _gender;

//   final Rx<String> _profesi = ''.obs;
//   Rx<String> get profesi => _profesi;

//   final Rx<String> _city = ''.obs;
//   Rx<String> get city => _city;

//   final Rx<bool> _isLoading = true.obs;
//   Rx<bool> get isLoading => _isLoading;

//   final Rx<bool> _isLoadingCourse = true.obs;
//   Rx<bool> get isLoadingCourse => _isLoadingCourse;

//   final Rx<bool> _isLoadingFaceRecog = true.obs;
//   Rx<bool> get isLoadingFaceRecog => _isLoadingFaceRecog;

//   final String _errorMessage = '';
//   String get errorMessage => _errorMessage;

//   final RxList<MyCourseEntity> _listCourse = <MyCourseEntity>[].obs;
//   RxList<MyCourseEntity> get listCourse => _listCourse;

//   final RxList<MyCourseEntity> _listCourseFinished = <MyCourseEntity>[].obs;
//   RxList<MyCourseEntity> get listCourseFinished => _listCourseFinished;

//   final Rx<ProfileEntity> _profile = ProfileEntity(
//     status: false,
//     tab: '',
//     data: ProfileDataEntity(
//       fullname: '',
//       location: '',
//       bio: '',
//       facebook: '',
//       twitter: '',
//       profession: '',
//       tglLahir: '',
//       provinsi: '',
//       kota: '',
//       jenisKelamin: '',
//       noHp: '',
//       pendidikanTerakhir: '',
//     ),
//   ).obs;
//   Rx<ProfileEntity> get profile => _profile;

//   final Rx<CoinEntity> _coin = CoinEntity(
//     coins: 0,
//     isCompleted: false,
//     createdAt: Timestamp.now(),
//     updatedAt: Timestamp.now(),
//     isOldUser: false,
//   ).obs;
//   Rx<CoinEntity> get coin => _coin;

//   // final Rx<FaceRecogEntity> _faceRecog =
//   //     const FaceRecogEntity(base64image: '', subjectId: '').obs;

//   // Rx<FaceRecogEntity> get faceRecog => _faceRecog;

//   Future _changeLoading(bool val) async {
//     _isLoading.value = val;
//   }

//   Future _fnChangeLoadingCourse(bool val) async {
//     _isLoadingCourse.value = val;
//   }

//   ///UNTUK MENSETUP SEMUA YG DIBUTUHIN DI CONTROLLER
//   Future _setup() async {
//     prefs = await SharedPreferences.getInstance();
//     _isLogin.value = prefs.getBool('user_login') ?? false;
//     _token.value = prefs.getString('token_access') ?? '';
//     _tokenWP.value = prefs.getString('token_access_wp') ?? '';
//     _tokenPrakerja.value = prefs.getString('token_access_prakerja') ?? '';
//     _avatar.value = prefs.getString('user_avatar') ?? '';
//     _name.value = prefs.getString('user_name') ?? '';
//     _email.value = prefs.getString('user_email') ?? '';
//     _userId.value = prefs.getString('user_id') ?? '';
//     _noHp.value = prefs.getString('user_hp') ?? '';
//     _gender.value = prefs.getString('user_gender') ?? '';
//     _provinsiName.value = prefs.getString('user_provincce_name') ?? '';
//     _tanggalLahir.value = prefs.getString('user_birth_date') ?? '';
//     _pendidikan.value = prefs.getString('user_degree') ?? '';
//     _profesi.value = prefs.getString('user_profesi') ?? '';
//     _city.value = prefs.getString('user_city') ?? '';
//   }

//   ///MENGAMBIL DATA PROFILE
//   Future getProfile() async {
//     _changeLoading(true);
//     final response = await _useCase.getProfile(_token.value);
//     response.fold(
//       ///IF RESPONSE IS ERROR
//       (fail) => ExceptionHandle.execute(fail),

//       ///IF RESPONSE SUCCESS
//       (data) async {
//         _profile.value = data;
//         await setValueToSpf();
//       },
//     );
//     await _changeLoading(false);
//   }

//   ///MENGAMBIL DATA MY COURSE
//   Future getMyCourse() async {
//     _fnChangeLoadingCourse(true);
//     final response = await _useCase.getMyCourse(_token.value);
//     response.fold(
//       ///IF RESPONSE IS ERROR
//       (fail) => ExceptionHandle.execute(fail),

//       ///IF RESPONSE SUCCESS
//       (data) async {
//         _listCourse.value = data;
//         for (int i = 0; i < data.length; i++) {
//           final date = DateTime.fromMicrosecondsSinceEpoch(
//               int.parse(data[i].userExpiry) * 1000000);
//           final expired = date.difference(DateTime.now()).inMicroseconds;
//           if ((data[i].userStatus == "3" || data[i].userStatus == "4") &&
//               expired >= 0) {
//             _listCourseFinished.add(data[i]);
//           }
//         }
//       },
//     );
//     await _fnChangeLoadingCourse(false);
//   }

//   ///SET ALL VALUE TO SHARED PREFERENCES
//   Future setValueToSpf() async {
//     _name.value = _profile.value.data.fullname;
//     _noHp.value = _profile.value.data.noHp;
//     _tanggalLahir.value = _profile.value.data.tglLahir;
//     _gender.value = _profile.value.data.jenisKelamin;
//     _provinsiName.value = _profile.value.data.provinsi;
//     _city.value = _profile.value.data.kota;
//     _pendidikan.value = _profile.value.data.pendidikanTerakhir;
//     _profesi.value = _profile.value.data.profession;
//     await prefs.setString('user_name', _name.value);
//     await prefs.setString('user_hp', _noHp.value);
//     await prefs.setString('user_birth_date', _tanggalLahir.value);
//     await prefs.setString('user_gender', _gender.value);
//     await prefs.setString('user_province_name', _provinsiName.value);
//     await prefs.setString('user_city', _city.value);
//     await prefs.setString('user_degree', _pendidikan.value);
//     await prefs.setString('user_profesi', _profesi.value);
//   }

//   ///STREAM COIN FROM FIRESTORE
//   Stream<CoinEntity> getCoin() {
//     return _useCase.getCoin(userId.value).map((event) {
//       _coin.value = event;
//       return _coin.value;
//     });
//   }

//   ///MENAMPILKAN DIALOG LOGOUT
//   void confirmLogout() {
//     log("LOGOUT FROM ARK");
//     AppDialog.dialogWithQuestion(
//       'Keluar',
//       'Anda yakin ingin keluar?',
//       'Batal',
//       'Lanjut',
//       () => logout(),
//     );
//   }

//   Future<void> logout() async {
//     try {
//       GetPlatform.isAndroid
//           ? await _googleSignIn.signOut()
//           : await _googleSignInIos.signOut();
//       await FacebookAuth.instance.logOut();
//       await prefs.clear();
//       Get.back();
//       Get.offAllNamed(AppRouteName.main);
//     } catch (e) {
//       log("ERROR LOGOUT : $e");
//     }
//   }

//   void resetPassword() async {
//     final response = await _useCase.resetPassword(_email.value, _token.value);
//     response.fold(
//       ///IF RESPONSE IS ERROR
//       (fail) => ExceptionHandle.execute(fail),

//       ///IF RESPONSE SUCCESS
//       (data) {
//         AppDialog.dialogStateWithLottie('success-animation.json',
//             'Tautan ubah password terkirim ke email anda!');
//         Future.delayed(const Duration(seconds: 2), () {
//           Get.back();
//         });
//       },
//     );
//   }
// }
