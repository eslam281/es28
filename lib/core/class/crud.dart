import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:es28/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;



class Crud {
  Future<Either<StatusRequest, dynamic>> getData(String linkurl) async {
    try {
        var response = await http.get(Uri.parse(linkurl));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }

    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

}
