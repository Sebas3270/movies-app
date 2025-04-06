// To parse this JSON data, do
//
//     final movieDbResponse = movieDbResponseFromMap(jsonString);

import 'dart:convert';
import 'package:movies_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieDbResponse {
    Dates? dates;
    int page;
    List<MovieMovieDb> results;
    int totalPages;
    int totalResults;

    MovieDbResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MovieDbResponse.fromJson(String str) => MovieDbResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MovieDbResponse.fromMap(Map<String, dynamic> json) => MovieDbResponse(
        dates: json["dates"] != null ? Dates.fromMap(json["dates"]) : null,
        page: json["page"],
        results: List<MovieMovieDb>.from(json["results"].map((x) => MovieMovieDb.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "dates": dates?.toMap(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    DateTime maximum;
    DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toMap() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}