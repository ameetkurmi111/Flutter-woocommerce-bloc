import '../routes/storeData.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CheckoutBlocEvent extends Equatable {
  CheckoutBlocEvent([List props = const []]) : super();
  List<Object> get props => [];
}

class LoadItemsEvent extends CheckoutBlocEvent {
  @override
  String toString() => 'LoadItemsEvent';
}

class AddItemCountEvent extends CheckoutBlocEvent {
  int itemCount;
  AddItemCountEvent(this.itemCount);
  @override
  List<Object> get props => [itemCount];
}

class RemoveItemCountEvent extends CheckoutBlocEvent {
  int itemCount;
  RemoveItemCountEvent(this.itemCount);

  @override
  List<Object> get props => [itemCount];
}

abstract class CheckoutBlocState extends Equatable {
  CheckoutBlocState([List props = const []]) : super();
//  List<Object> get props => [];

}

class LoadingCheckoutState extends CheckoutBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];

  @override
  String toString() => 'LoadingCheckoutState';
}

class LoadedCheckoutBlocState extends CheckoutBlocState {
  List<Object> get props => [];

  Map<String, String> productNamePrice = Map<String, String>();
  LoadedCheckoutBlocState({this.productNamePrice}) : super([productNamePrice]);

  @override
  String toString() => 'LoadingCheckoutState';
}

class AddItemCountState extends CheckoutBlocState {
  int itemCount = 0;
  AddItemCountState({this.itemCount});

  @override
  List<Object> get props => [itemCount];
}

class RemoveItemCountState extends CheckoutBlocState {
  int itemCount = 0;
  RemoveItemCountState({this.itemCount});
  @override
  List<Object> get props => [itemCount];
}

class CheckoutBloc extends Bloc<CheckoutBlocEvent, CheckoutBlocState> {
  StoreData _storeData = StoreData();

  CheckoutBloc(CheckoutBlocState initialState) : super(LoadingCheckoutState());
  @override
  CheckoutBlocState get initialState => LoadingCheckoutState();

  @override
  Stream<CheckoutBlocState> mapEventToState(
    CheckoutBlocEvent event,
  ) async* {
    if (event is LoadItemsEvent) {
      yield* _mapLoadEventToState(event);
    } else if (event is AddItemCountEvent) {
      yield AddItemCountState(itemCount: event.itemCount);
    } else if (event is RemoveItemCountEvent) {
      yield (RemoveItemCountState(itemCount: event.itemCount));
    }
  }

  Stream<CheckoutBlocState> _mapLoadEventToState(event) async* {
    yield LoadingCheckoutState();
//    Load all the items from the StoreData class and place it in the Map

    Map<String, String> products = _storeData.retrieveProductDetails();
    Map<String, String> productNamePrice = Map<String, String>();
    products.forEach((k, v) => productNamePrice[k] = v);
    yield LoadedCheckoutBlocState(productNamePrice: productNamePrice);
  }
}
