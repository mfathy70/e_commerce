import 'package:e_commerce/model/restaurant_data.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Welcome>?> getRestaurantsData() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return welcomeFromJson(json);
    }
  }

  Future<void> getLocationFromLatLong(
      {required String lat, required String long}) async {
    var client = http.Client();
    print("$lat,$long");

    var uri = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&sensor=false&key=AIzaSyBdCFQ-57AwfLofpxfWjx-IAma-s5cCWk4');

    var response = await client.get(uri);

    // if (response.statusCode == 200) {
    var json = response.body;
    print("result $json");
    //  }
  }
}
