import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

class LiveStatsService {

  // =========================
  // CSV LINKS
  // =========================

  static const String joinSheet =
      'https://docs.google.com/spreadsheets/d/e/2PACX-1vTQO7qHQW9jEKB8CfIEOS9ofHrEri6r24gh87_UfY5EMbTXNRtzVlPZBdQ-0Fx-VSPcdbWXq_RIBEtb/pub?output=csv';

  static const String chapterSheet =
      'https://docs.google.com/spreadsheets/d/e/2PACX-1vQXiK4Blp7IUhNpmLUoLiKHkBghjUzj0OgzY8x3HxRd2g3_T3Mbkhvv-qoQ9sAnruZAfhJJLwZPxJnS/pub?output=csv';

  static const String committeeSheet =
      'https://docs.google.com/spreadsheets/d/e/2PACX-1vSRtsCk-fhKCUiRlowD78qzizUqLtxJHBdvQlNGG0Tp8LWZfkNxlkbd1AwVcYUBV8wXnb6WyXbXJCWi/pub?output=csv';

  // =========================
  // SUPPORTERS
  // =========================

  static Future<int> getSupporters() async {

    final join =
        await _getRowCount(joinSheet);

    final chapters =
        await _getRowCount(chapterSheet);

    final committee =
        await _getRowCount(committeeSheet);

    return join + chapters + committee;
  }

  // =========================
  // VOLUNTEERS
  // =========================

  static Future<int> getVolunteers() async {

    return await _getRowCount(
      committeeSheet,
    );
  }

  // =========================
  // CHAPTERS
  // =========================

  static Future<int> getUniqueChapters() async {

    final response =
        await http.get(
      Uri.parse(chapterSheet),
    );

    final csvData =
        const CsvToListConverter()
            .convert(response.body);

    if (csvData.length <= 1) {
      return 0;
    }

    final uniqueLocations = <String>{};

    for (int i = 1; i < csvData.length; i++) {

      final row = csvData[i];

      // =========================
      // CITY = COLUMN E
      // STATE = COLUMN F
      // =========================

      if (row.length >= 6) {

        final city =
            row[4].toString().trim();

        final state =
            row[5].toString().trim();

        uniqueLocations.add(
          '$city-$state',
        );
      }
    }

    return uniqueLocations.length;
  }

  // =========================
  // GENERIC ROW COUNT
  // =========================

  static Future<int> _getRowCount(
    String url,
  ) async {

    final response =
        await http.get(
      Uri.parse(url),
    );

    final csvData =
        const CsvToListConverter()
            .convert(response.body);

    if (csvData.isEmpty) {
      return 0;
    }

    return csvData.length - 1;
  }
}