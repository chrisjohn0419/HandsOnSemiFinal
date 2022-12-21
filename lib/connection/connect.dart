import 'package:hand_on/model/post.dart';
import 'package:http/http.dart' as http;

class Connection {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try{
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        return postFromJson(json);
     }
    }catch (Exception) {
      print(Exception);
      print("Error occured");

    }
  }
}