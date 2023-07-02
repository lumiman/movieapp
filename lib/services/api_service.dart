import 'dart:convert';
import 'package:movieapp/models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

// https://www.themoviedb.org/settings/api
// https://developer.themoviedb.org/reference/movie-credits

class APIService{
  Future<List<MovieModel>> getMovies() async {
    List<MovieModel> movies = [];
    String _url =
        "$pathProduction/discover/movie?include_adult=false&language=en-US&page=1&api_key=$apiKey";
    Uri _uri = Uri.parse(_url);
    http.Response _response = await http.get(_uri);
    if (_response.statusCode == 200) {
      Map<String, dynamic> movieMap = json.decode(_response.body);
      movies = movieMap['results'].map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
      return movies;
    }
    return movies;
  }

  Future<MovieDetailModel?> getMovie(int movieId) async{
    String _url = "$pathProduction/movie/$movieId?language=en-U&api_key=$apiKey";
    Uri _uri = Uri.parse(_url);
    http.Response _response = await http.get(_uri);
    if (_response.statusCode == 200) {
      Map<String, dynamic> movieMap = json.decode(_response.body);

      MovieDetailModel movieDetailModel = MovieDetailModel.fromJson(movieMap);
      return movieDetailModel;
    }
    return null;
  }
}