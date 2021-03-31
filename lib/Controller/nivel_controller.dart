import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:cursoweb/Model/nivel_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NivelController {
  //STREAMS
  final niveisStream = BehaviorSubject<List<NivelModel>>();
  Stream<List<NivelModel>> get outNivelStream => niveisStream.stream;
  Function(List<NivelModel>) get changeNiveis => niveisStream.sink.add;
  List<NivelModel> get getItem => niveisStream.value;

  final nivelStream = BehaviorSubject<NivelModel>();
  Stream<NivelModel> get outNivel => nivelStream.stream;
  Function(NivelModel) get changeNivel => nivelStream.sink.add;
  NivelModel get getNivel => nivelStream.value;

  final boolStream = BehaviorSubject<bool>();
  Stream<bool> get outBool => boolStream.stream;
  Function(bool) get changeBool => boolStream.sink.add;
  bool get getbool => boolStream.value;

  Future<List<NivelModel>> getAllNiveis() async {
    var baseURL = Uri.parse('http://localhost:4000/api/niveis/');
    final response = await http.get(baseURL);
    if (response.statusCode == 200) {
      return compute(parseNiveis, response.body);
    } else if (response.statusCode == 401) {
      return null;
    }
    return null;
  }

  Future<bool> insertNivel(NivelModel model) async {
    var baseURL = Uri.parse('http://localhost:4000/api/niveis/');
    final response = await http.post(baseURL, body: model.toJsonForInsert());
    print('Inserido? -> ${response.statusCode}');
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 500) {
      return false;
    }
    return null;
  }

  Future<bool> updateNivel(NivelModel model) async {
    var baseURL = Uri.parse('http://localhost:4000/api/niveis/${model.sId}');
    final response = await http.put(baseURL, body: model.toJsonForInsert());
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 500) {
      return false;
    }
    return null;
  }

  Future<List<NivelModel>> getAllNiveisById(String idcurso) async {
    var baseURL =
        Uri.parse('http://localhost:4000/api/niveis/search?idcurso=$idcurso');
    final response = await http.get(baseURL);
    if (response.statusCode == 200) {
      return compute(parseNiveis, response.body);
    } else if (response.statusCode == 401) {
      return null;
    }
    return null;
  }

  List<NivelModel> parseNiveis(String body) {
    final parsed = jsonDecode(body).cast<Map<String, dynamic>>();
    return parsed.map<NivelModel>((json) => NivelModel.fromJson(json)).toList();
  }

  Future<String> removeNivel(String id) async {
    print('Removendo objeto id: $id');
    var baseURL = Uri.parse('http://localhost:4000/api/niveis/$id');
    final response = await http.delete(baseURL);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  @override
  void dispose() {
    niveisStream.close();
    nivelStream.close();
    boolStream.close();
  }
}
