import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  
  static String movieKey = dotenv.env['MOVIEDB_API_KEY'] ?? 'No hay api key';

}