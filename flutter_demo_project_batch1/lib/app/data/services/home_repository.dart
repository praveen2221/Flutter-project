import '../provider/api_provider.dart';

class HomeRepository {
  static final _singleton = HomeRepository();
  static HomeRepository get instance => _singleton;
  Future getHomeDetails() async {
    return await APIProvider.instance
        .get('http://demo6840779.mockable.io/businessCategoryList');
  }

  Future updateHomeDetails() async {
    return await APIProvider.instance
        .post('http://demo6840779.mockable.io/insertRecord');
  }
}
