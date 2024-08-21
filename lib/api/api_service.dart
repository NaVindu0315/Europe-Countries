import 'package:europe_countries/Models/Countries_Model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

class Apis {
  static const String album =
      '/v3.1/region/europe?fields=name,capital,flags,region,languages,population,capital';
}

@RestApi(baseUrl: "https://restcountries.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET(Apis.album)
  Future<List<Country>> getCountry();
}
