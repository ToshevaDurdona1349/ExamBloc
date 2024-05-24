import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../models/bitcoin_model.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeBitcoinListState extends HomeState {
  final List<Article> articles;

  HomeBitcoinListState(this.articles);

  @override
  List<Object> get props => [articles];
}