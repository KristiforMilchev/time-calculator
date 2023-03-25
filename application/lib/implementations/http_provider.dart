// ignore_for_file: avoid_shadowing_type_parameters

import 'dart:convert';
import 'package:domain/models/http_request.dart';

import 'package:http/http.dart' as http;
import 'package:infrastructure/interfaces/ihttp_provider_service.dart';

class HttpProvider<T> implements IHttpProviderService<T> {
  @override
  Future<T> getRequest<T>(HttpRequest request) async {
    final response =
        await http.get(Uri.parse(request.url), headers: request.headers);

    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body) as T;
      } catch (e) {
        return response.body as T;
      }
    } else {
      throw Exception('Failed to load request: ${request.url}');
    }
  }

  @override
  Future<T> postRequest<T>(HttpRequest request) async {
    var result = await http.post(
      Uri.parse(request.url),
      headers: request.headers,
      body: jsonEncode(request.params),
    );

    if (result.statusCode == 200) {
      try {
        return jsonDecode(result.body) as T;
      } catch (e) {
        return result.body as T;
      }
    }

    throw Exception(
        "Failed to post data ${request.url}  Data: ${request.params}");
  }

  @override
  Future<T> putReqest<T>(HttpRequest request) async {
    var result = await http.put(
      Uri.parse(request.url),
      headers: request.headers,
      body: jsonEncode(request.params),
    );

    if (result.statusCode == 200) {
      try {
        return jsonDecode(result.body) as T;
      } catch (e) {
        return result.body as T;
      }
    }

    throw Exception(
        "Failed to put data ${request.url}  Data: ${request.params}");
  }
}
