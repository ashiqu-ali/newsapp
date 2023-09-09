import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/model/model.dart';

class ApiServices{
  Future<List<Article>> getArticle() async {
    Uri url = Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&apiKey=350ffdb19d5b4ff5895e63f6b1bd2486');

    var response = await http.get(url);


    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<Article> _data = List<Article>.from(
        body['articles'].map((e)=>Article.fromJson(e)).toList()


      );
      return _data;
    } else {
      List<Article> _data=[];
      return _data;
      throw Exception('Failed to load album');
    }
  }
}



// API : https://newsapi.org/v2/everything?q=bitcoin&apiKey=350ffdb19d5b4ff5895e63f6b1bd2486