// import 'dart:developer';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_demo_project_batch1/app/data/provider/api_endpoint.dart';
// import '../provider/api_provider.dart';

// class AuthRepository {
//   static final _singleton = AuthRepository();
//   static AuthRepository get instance => _singleton;

//   Future<AppResponse> login(String username, String password) async {
//     return await APIProvider.instance
//         .post(APIEndpoint.login, {'email': username, 'password': password});
//   }

//   Future forgotPassword({required String email}) async {
//     Map<String, dynamic> data = {};

//     try {
//       final response = await APIProvider.instance
//           .post(APIEndpoint.forgotPassword, {'email': email});

//       data = response.responseBody;
//     } catch (e) {
//       return e;
//     }

//     return data;
//   }

//   Future resetPassword(
//       {required String email,
//       required String password,
//       required String otp}) async {
//     Map<String, dynamic> data = {};

//     try {
//       final response = await APIProvider.instance.post(
//           APIEndpoint.resetPassword,
//           {'email': email, 'password': password, 'otp': otp});
//       return response;
//     } catch (e) {
//       if (kDebugMode) {
//         log("errror >>>>>>>> $e");
//       }
//     }
//   }

//   Future<AppResponse> deleteAccount() async {
//     return await APIProvider.instance.delete(APIEndpoint.deleteAccount);
//   }

//   // Future<AppResponse> signUp(SignUpModel model) async {
//   //   FormData formData = FormData.fromMap(model.toJson());

//   //   return await APIProvider.instance.post(APIEndpoint.register, formData);
//   // }

//   Future<AppResponse> countriesList() async {
//     return await APIProvider.instance.get(APIEndpoint.countries);
//   }

//   Future<AppResponse> citiesList(int id) async {
//     return await APIProvider.instance
//         .post(APIEndpoint.cities, {"country_id": id});
//   }
// }
