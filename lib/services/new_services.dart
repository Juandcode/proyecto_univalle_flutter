import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/new_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '055b6f51d157422f9c07027da7ca030d';

class NewsServices with ChangeNotifier {
  List<Article> headlines = [];
  String? category;

  Future<void> changeCategory(String? newCategory) async {
    headlines = [];
    category = newCategory;
    notifyListeners();
    await getByCategory();
    //notifyListeners();
  }

  NewsServices() {
    getTopHeadlines();
    //getByCategory();
  }

  Future<void> getByCategory() async {
    final url = Uri.parse(
      '$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY'
      '${category != null ? '&category=$category' : ''}',
    );
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final newResponse = reqResListadoFromJson(resp.body);
        debugPrint(resp.body);
        headlines.addAll(newResponse.articles);

      } else {
        debugPrint('Error al cargar las noticias ${resp.statusCode}');
      }
    } catch (e) {
      debugPrint('Excepcion al cargar las noticias $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> getTopHeadlines() async {
    final url = Uri.parse(
      '$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY',
    );
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final newResponse = reqResListadoFromJson(resp.body);
        headlines.addAll(newResponse.articles);
        notifyListeners();
      } else {
        debugPrint('Error al cargar las noticias ${resp.statusCode}');
      }
    } catch (e) {
      debugPrint('Excepcion al cargar las noticias $e');
    }
  }
}
