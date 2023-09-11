// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WordsListStore on _WordsListStore, Store {
  late final _$wordsListAtom =
      Atom(name: '_WordsListStore.wordsList', context: context);

  @override
  dynamic get wordsList {
    _$wordsListAtom.reportRead();
    return super.wordsList;
  }

  @override
  set wordsList(dynamic value) {
    _$wordsListAtom.reportWrite(value, super.wordsList, () {
      super.wordsList = value;
    });
  }

  late final _$tmpListAtom =
      Atom(name: '_WordsListStore.tmpList', context: context);

  @override
  List<String> get tmpList {
    _$tmpListAtom.reportRead();
    return super.tmpList;
  }

  @override
  set tmpList(List<String> value) {
    _$tmpListAtom.reportWrite(value, super.tmpList, () {
      super.tmpList = value;
    });
  }

  late final _$formatedWordsListAtom =
      Atom(name: '_WordsListStore.formatedWordsList', context: context);

  @override
  List<String> get formatedWordsList {
    _$formatedWordsListAtom.reportRead();
    return super.formatedWordsList;
  }

  @override
  set formatedWordsList(List<String> value) {
    _$formatedWordsListAtom.reportWrite(value, super.formatedWordsList, () {
      super.formatedWordsList = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_WordsListStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_WordsListStore.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
wordsList: ${wordsList},
tmpList: ${tmpList},
formatedWordsList: ${formatedWordsList},
loading: ${loading}
    ''';
  }
}
