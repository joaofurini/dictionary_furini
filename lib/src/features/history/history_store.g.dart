// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryStore on HistoryStoreBase, Store {
  late final _$counterAtom =
      Atom(name: 'HistoryStoreBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$searchedWordsAtom =
      Atom(name: 'HistoryStoreBase.searchedWords', context: context);

  @override
  List<dynamic> get searchedWords {
    _$searchedWordsAtom.reportRead();
    return super.searchedWords;
  }

  @override
  set searchedWords(List<dynamic> value) {
    _$searchedWordsAtom.reportWrite(value, super.searchedWords, () {
      super.searchedWords = value;
    });
  }

  @override
  String toString() {
    return '''
counter: ${counter},
searchedWords: ${searchedWords}
    ''';
  }
}
