import 'package:dio/dio.dart';
import 'model.dart';

class controller {
  Dio dio = Dio();
  Future<List<Article>> fetchData() async {
    final response = await dio.get('https://breakingbadapi.com/api/characters');
    final resp = response.data as List;
    print(resp);
    List<Article> article = [];
    resp.forEach((element) {
      Article art = Article.fromJson(element);
      article.add(art);
      print(response.data);
    });
    return article;
  }
}
