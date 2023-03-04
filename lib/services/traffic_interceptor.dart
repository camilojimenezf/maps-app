import 'package:dio/dio.dart';

const accessToken =
    'pk.eyJ1IjoiY2FtaWxvamltZW5lemYiLCJhIjoiY2xlazVqcWJsMDc1ZzNzcm4wNnNvMTkybiJ9.zGQAnqsQnpXrHnk0YzQjwA';

class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'steps': false,
      'overview': 'simplified',
      'access_token': accessToken,
    });
    super.onRequest(options, handler);
  }
}
// /driving
// /-72.103319%2C-36.606662%3B-71.958121%2C-36.424819
// ?alternatives=true
// &geometries=geojson
// &language=en
// &overview=simplified&steps=true