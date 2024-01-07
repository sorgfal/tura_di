import 'package:code_builder_example/common/api_client.dart';
import 'package:code_builder_example/common/persist_storage.dart';
import 'package:generator/annotation.dart';

@turaFactory
class NewsDataSource {
  final ApiClient apiClient;
  final PersistStorage storage;

  NewsDataSource(this.apiClient, {required this.storage});
}
