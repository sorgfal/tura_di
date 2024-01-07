import 'package:code_builder_example/data/data_source/news_data_source.dart';
import 'package:generator/annotation.dart';

@TuraFactory(cast: INewsRepository)
class NewsRepository implements INewsRepository {
  final NewsDataSource dataSource;

  NewsRepository(this.dataSource);
}

abstract class INewsRepository {}
