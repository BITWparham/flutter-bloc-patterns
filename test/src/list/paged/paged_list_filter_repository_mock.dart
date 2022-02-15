import 'package:flutter_bloc_patterns/page.dart';
import 'package:flutter_bloc_patterns/paged_filter_list.dart';
import 'package:flutter_bloc_patterns/src/list/paged/paged_list_filter_repository.dart';

import 'paged_list_repository_mock.dart';

class InMemoryPagedListFilterRepository<T, F>
    implements PagedListFilterRepository<T, F> {
  final List<T> elements;

  InMemoryPagedListFilterRepository(this.elements);

  @override
  Future<List<T>> getAll(Page page) async {
    return InMemoryPagedListRepository(elements).getAll(page);
  }

  @override
  Future<List<T>> getBy(Page page, F filter) {
    final elementsMatchingFilter =
        elements.where((item) => item == filter).toList();
    return InMemoryPagedListRepository(elementsMatchingFilter).getAll(page);
  }
}

class FailingPagedListFilterRepository<T, F>
    implements PagedListFilterRepository<T, F> {
  final Object error;

  FailingPagedListFilterRepository(this.error);

  @override
  Future<List<T>> getAll(Page page) => Future.error(error);

  @override
  Future<List<T>> getBy(Page page, F filter) => Future.error(error);
}
