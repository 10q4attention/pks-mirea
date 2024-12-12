import '../api/instance.dart';
import '../models/device.dart';


class ProductService {
  static Future<List<Device>> getProducts() async {
    final response = await api.get('/products');
    return (response.data as List)
        .map((product) => Device.fromJson(product))
        .toList();
  }
}