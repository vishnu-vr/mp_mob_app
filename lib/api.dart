import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> getQuizNames() {
  return http.post(
    'https://mathspartner.com/get_list_of_quiz',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> getQuizData(String quizName) {
  return http.post(
    'https://mathspartner.com/user_details_from_quiz_name',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'quiz_name': quizName,
    }),
  );
}

Future<http.Response> delete(String id) {
  return http.post(
    'https://mathspartner.com/delete_user_result',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'row_id': id,
    }),
  );
}
