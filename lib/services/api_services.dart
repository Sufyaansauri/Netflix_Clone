import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/Upcoming_model.dart';
import "package:http/http.dart" as http;
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/models/movie_recommendation_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';

const baseUrl = "https://api.themoviedb.org/3/";

var key = "api_key=$apiKey";
late String endPoint;

class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming?language=en-US&page=1&";
    final url = "$baseUrl$endPoint$key";
    // final url = "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&api_key=82ce41c5578f034aa49431147f638f65";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // print('this is the response ${response.body}');
      //response : ${response.body}
      log("success");
      return UpcomingMovieModel.fromJson(
        jsonDecode(response.body),
      );
    }
    //  else {
    //   print('this is the else response ${response.body}');
    // }
    throw Exception("Failed to Load upcoming movies");
  }

  Future<UpcomingMovieModel> getNowPlayingMovies() async {
    endPoint = "movie/now_playing?language=en-US&page=1&";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("success");
      return UpcomingMovieModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception("Failed to Load now playing movies");
  }

  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = "tv/top_rated?language=en-US&page=1&";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("success");
      return TvSeriesModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception("Failed to Load top rated Tv series");
  }

  Future<SearchModel> getSearchedMovie(String searchText) async {
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint";

    final response = await http.get(Uri.parse(url), headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MmNlNDFjNTU3OGYwMzRhYTQ5NDMxMTQ3ZjYzOGY2NSIsIm5iZiI6MTczMTQzMjc2Ny43NDk2MDExLCJzdWIiOiI2NzI3NDU4ZjI5NzM1ZDZhMDRkYTY1ODgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.C_7w6BQNz4HejXiIM62coNvZk7nXdBjttpZbVBMvbqQ",
    });

    if (response.statusCode == 200) {
      log("success");
      return SearchModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception("Failed to Load Searched movie");
  }

  Future<MovieRecommendationModel> getPopularMovies() async {
    endPoint = "movie/popular?language=en-US&page=1&";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("success");
      return MovieRecommendationModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception("Failed to Load popular movies");
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = "movie/$movieId";
    final url = "$baseUrl$endPoint";

    final response = await http.get(Uri.parse(url), headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MmNlNDFjNTU3OGYwMzRhYTQ5NDMxMTQ3ZjYzOGY2NSIsIm5iZiI6MTczMTQzMjc2Ny43NDk2MDExLCJzdWIiOiI2NzI3NDU4ZjI5NzM1ZDZhMDRkYTY1ODgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.C_7w6BQNz4HejXiIM62coNvZk7nXdBjttpZbVBMvbqQ",
    });

    if (response.statusCode == 200) {
      log("success");
      return MovieDetailModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception("Failed to Load movie detail");
  }
  Future<MovieRecommendationModel> getMovieRecommendation(int movieId) async {
    endPoint = "movie/$movieId/recommendations";
    final url = "$baseUrl$endPoint";

    final response = await http.get(Uri.parse(url), headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MmNlNDFjNTU3OGYwMzRhYTQ5NDMxMTQ3ZjYzOGY2NSIsIm5iZiI6MTczMTQzMjc2Ny43NDk2MDExLCJzdWIiOiI2NzI3NDU4ZjI5NzM1ZDZhMDRkYTY1ODgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.C_7w6BQNz4HejXiIM62coNvZk7nXdBjttpZbVBMvbqQ",
    });

    if (response.statusCode == 200) {
      log("success");
      return MovieRecommendationModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception("Failed to Load more like this");
  }
}
