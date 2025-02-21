import 'package:flutter_test_pln/services/net_utils.dart';

class RestApi {
  final NetworkUtil _util = NetworkUtil();
  final url = "https://jsonplaceholder.typicode.com";

  Future<dynamic> fetchToDoList(
      {required String todos, Map<String, String>? header}) {
    return _util.get("$url/$todos").then((value) {
      // if (value['status'] != Constant.statusSuccess) throw value['message'];

      return value;
    });
  }

  Future<dynamic> deleteToDoList(
      {required int id, Map<String, String>? header}) {
    return _util.delete("$url/todos/$id").then((value) {
      // if (value['status'] != Constant.statusSuccess) throw value['message'];

      return value;
    });
  }

  Future<dynamic> detailToDoList(
      {required int id, Map<String, String>? header}) {
    return _util.get("$url/todos/$id").then((value) {
      // if (value['status'] != Constant.statusSuccess) throw value['message'];

      return value;
    });
  }

  Future<dynamic> submitEdit(
      {required int id,
      Map<String, String>? header,
      var body,
      Map<String, String>? param}) {
    return _util
        .put(
      "$url/todos/$id",
      body: body,
    )
        .then((value) {
      // if (value['status'] != Constant.statusSuccess) throw value['message'];

      return value;
    });
  }

  Future<dynamic> submit(
      {Map<String, String>? header, var body, Map<String, String>? param}) {
    return _util
        .post(
      "$url/todos",
      body: body,
    )
        .then((value) {
      // if (value['status'] != Constant.statusSuccess) throw value['message'];

      return value;
    });
  }
}
