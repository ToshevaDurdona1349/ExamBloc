import 'package:bloc/bloc.dart';
import '../models/bitcoin_model.dart';
import '../services/http_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Article> articles = [];

  HomeBloc() : super(HomeInitialState()) {
    on<LoadBitcoinListEvent>(_onLoadArticlesListEvent);
  }

  Future<void> _onLoadArticlesListEvent(LoadBitcoinListEvent event, Emitter<HomeState> emit) async{
    var response =
    await Network.GET(Network.API_GET_BITCOIN, Network.paramsArticle());

    var articleList = Network.parseArticles(response!);
    articles.addAll(articleList);
    emit(HomeBitcoinListState(articles));
  }
}