// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InitializerGenerator
// **************************************************************************

import 'package:code_builder_example/common/api_client.dart';
import 'package:code_builder_example/data/repository/news_repository.dart';
import 'package:code_builder_example/data/data_source/news_data_source.dart';
import 'package:code_builder_example/common/persist_storage.dart';

class TuraContainerBox {
  ///
  static ApiClient? _apiClient;
  static PersistStorage? _persistStorage;

  ///
  ApiClient get getApiClient => _apiClient ??= ApiClient();
  INewsRepository get getNewsRepository => NewsRepository(getNewsDataSource);
  NewsDataSource get getNewsDataSource =>
      NewsDataSource(getApiClient, storage: getPersistStorage);
  PersistStorage get getPersistStorage => _persistStorage ??= PersistStorage();

  ///
  TuraContainerBox() {
    getPersistStorage;
  }
}
