import 'package:flutter_test_pln/services/net_utils.dart';

class RestApi {
  final NetworkUtil _util = NetworkUtil();
  final url = "https://jsonplaceholder.typicode.com/";

  Future<dynamic> fetchToDoList(
      {required String todos, Map<String, String>? header}) {
    return _util.get("$url/$todos").then((value) {
      // if (value['status'] != Constant.statusSuccess) throw value['message'];

      return value;
    });
  }

  Future<dynamic> detaiToDoList(
      {required int id, Map<String, String>? header}) {
    return _util.delete("$url/$id").then((value) {
      // if (value['status'] != Constant.statusSuccess) throw value['message'];

      return value;
    });
  }

  Future<dynamic> deleteToDoList(
      {required int id, Map<String, String>? header}) {
    return _util.get("$url/todos/$id").then((value) {
      // if (value['status'] != Constant.statusSuccess) throw value['message'];

      return value;
    });
  }
}
