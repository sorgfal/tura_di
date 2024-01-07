// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InitializerGenerator
// **************************************************************************

import 'package:code_builder_example/common/persist_storage.dart';
import 'package:code_builder_example/data/repository/news_repository.dart';
import 'package:code_builder_example/data/data_source/news_data_source.dart';
import 'package:code_builder_example/common/api_client.dart';

class TuraContainer {
  ///
  static PersistStorage? _persistStorage;
  static ApiClient? _apiClient;

  ///
  PersistStorage get getPersistStorage => _persistStorage ??= PersistStorage();
  INewsRepository get getNewsRepository => NewsRepository(getNewsDataSource);
  NewsDataSource get getNewsDataSource =>
      NewsDataSource(getApiClient, storage: getPersistStorage);
  ApiClient get getApiClient => _apiClient ??= ApiClient();

  ///
  TuraContainer() {
    getPersistStorage;
  }
}
