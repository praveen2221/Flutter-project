// import 'package:dio/dio.dart';

// import '../provider/api_endpoint.dart';
// import '../provider/api_provider.dart';

// class OffersRepository {
//   static final _singleton = OffersRepository();
//   static OffersRepository get instance => _singleton;

//   Future<AppResponse> home({double? latitude, double? longitude}) async {
//     return await APIProvider.instance.post(
//         APIEndpoint.getHome, {'latitude': latitude, 'longitude': longitude});
//   }

//   Future<AppResponse> offerExist({double? latitude, double? longitude}) async {
//     return await APIProvider.instance.post(
//         APIEndpoint.offerExist, {'latitude': latitude, 'longitude': longitude});
//   }

//   Future<AppResponse> requestNotification(
//       {double? latitude, double? longitude}) async {
//     return await APIProvider.instance.post(APIEndpoint.requestNotification,
//         {'latitude': latitude, 'longitude': longitude});
//   }

//   Future<AppResponse> fetchCategories() async {
//     return await APIProvider.instance.post(APIEndpoint.category, {});
//   }

//   Future<AppResponse> fetchCategoryOffers(
//     int categoryId,
//     double latitude,
//     double longitude, {
//     int page = 1,
//   }) async {
//     return await APIProvider.instance.post(APIEndpoint.categoryOffers, {
//       'category': categoryId,
//       'page': page,
//       // 'latitude': latitude,
//       // 'longitude': longitude
//     });
//   }

//   Future<AppResponse> getOfferDetails(String offer) async {
//     return await APIProvider.instance.post(APIEndpoint.offerDetails, {
//       'offer': offer,
//     });
//   }

//   Future<AppResponse> getOfferRatings(String offer, {int page = 0}) async {
//     return await APIProvider.instance
//         .post(APIEndpoint.offerRatings, {'offer': offer, 'page': page});
//   }

//   Future<AppResponse> addFavouriteOffer(String offer) async {
//     return await APIProvider.instance.post(APIEndpoint.addToFavourites, {
//       'offer': offer,
//     });
//   }

//   Future<AppResponse> getFavouriteList(String offer) async {
//     return await APIProvider.instance.get(APIEndpoint.getFavourites);
//   }

//   Future<AppResponse> getCategoryBrands(String category) async {
//     return await APIProvider.instance.post(APIEndpoint.getBrands, {
//       'category': category,
//     });
//   }

//   Future<AppResponse> getBrandOffers(String brand) async {
//     return await APIProvider.instance.post(APIEndpoint.getBrandOffers, {
//       'brand': brand,
//     });
//   }

//   Future<AppResponse> rateAndCommentOffer(
//     int userID,
//     int offerId,
//     int rating,
//     String comment,
//   ) async {
//     return await APIProvider.instance.post(APIEndpoint.rateAndComment, {
//       'user_id': userID,
//       'offer_id': offerId,
//       'rating': rating,
//       'comment': comment
//     });
//   }

//   Future<AppResponse> search(
//     String search,
//     double latitude,
//     double longitude, {
//     int? country,
//     List<int>? categories = const [],
//     double? minDisc,
//     double? maxDisc,
//     bool popularity = true,
//     bool latest = false,
//     String? destination = '',
//   }) async {
//     return await APIProvider.instance.post(
//         APIEndpoint.search,
//         FormData.fromMap({
//           'keyword': search,
//           'country': country,
//           'categories': categories!.isEmpty ? null : categories.join(','),
//           'discount_min': minDisc,
//           'discount_max': maxDisc,
//           'popularity': true,
//           'latest': false,
//           'latitude': latitude,
//           'longitude': longitude,
//           'destination': destination
//         }));
//   }

//   Future<AppResponse> searchWithOutLatLng(
//     String search, {
//     double? latitude,
//     double? longitude,
//     int? country,
//     List<int>? categories = const [],
//     double? minDisc,
//     double? maxDisc,
//     bool? popularity = true,
//     bool? latest = false,
//     String? destination = '',
//   }) async {
//     return await APIProvider.instance.post(
//         APIEndpoint.search,
//         FormData.fromMap({
//           'keyword': search,
//           'country': country,
//           'categories': categories!.isEmpty ? null : categories.join(','),
//           'discount_min': minDisc,
//           'discount_max': maxDisc,
//           'popularity': true,
//           'latest': false,
//           // 'latitude': latitude,
//           // 'longitude': longitude,
//           'destination': destination
//         }));
//   }
// }
