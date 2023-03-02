import 'package:e_commerce/model/restaurant_data.dart';
import 'package:http/http.dart' as http;

import '../model/products.data.dart';

class RemoteService {
  Future<List<Products>?> getProducts() async {
    var client = http.Client();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return productsFromJson(json);
    }
    return null;
  }

  Future<List<Welcome>?> getRestaurantsData() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    var response = await client.get(uri);

    try {
      if (response.statusCode == 200) {
        var json = response.body;
        return welcomeFromJson(json);
      }
    } catch (e) {
      // TODO
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
