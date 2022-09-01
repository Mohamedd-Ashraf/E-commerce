import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/uitils/my_string.dart';
import 'package:http/http.dart' as http;
 class ProductServices {

  static Future<List<Product>>  getProduct()async{
   var response= await  http.get(Uri.parse('$baseUrl/products'));
   if (response.statusCode == 200 ) {
    var jsondata= response .body;
    return productFromJson(jsondata);
   } else {
     print("Api Connection faield ");

     return throw Exception("Api Connection faield ");
   }
  }
  
   
 }