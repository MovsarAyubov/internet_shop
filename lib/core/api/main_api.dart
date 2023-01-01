import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_shop/core/api/client.dart';

@Injectable()
class MainApi {
  const MainApi();

  RestClient client() {
    final dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    return RestClient(dio, baseUrl: "https://api.escuelajs.co/api/v1/");
  }
}
