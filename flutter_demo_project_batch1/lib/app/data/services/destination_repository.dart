import '../provider/api_endpoint.dart';
import '../provider/api_provider.dart';

class DestinationRepository {
  static final _singleton = DestinationRepository();
  static DestinationRepository get instance => _singleton;
  Future<AppResponse> getDestinationDetails() async {
    return await APIProvider.instance.get(APIEndpoint.getdestination);
  }
}
