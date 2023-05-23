import 'package:connect/review.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
class Services{
  static const String url = 'https://revieworder.vercel.app/api/reviews';

  static Future<List<Review>> getInfo() async{
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<Review> review= reviewFromJson(response.body) as List<Review>;
        return review;
      }
      else{
        Fluttertoast.showToast(msg: 'Error occurred. Please try again');
        return <Review>[];
      }
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
      return <Review>[];
    }
  }
}