import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/repositories/products/products_repository.dart';
import '../../pages/home/home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(
    this._productsRepository,
  ) : super(const HomeState.initial());

  Future<void> load() async {
    emit(
      state.copyWith(status: HomeStateStatus.loading),
    );
    try {
      final products = await _productsRepository.findAllProducts();
      emit(
        state.copyWith(
          status: HomeStateStatus.loaded,
          products: products,
        ),
      );
    } on Exception catch (error) {
      // TODO
    }
  }
}
