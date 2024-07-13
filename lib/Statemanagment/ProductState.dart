part of 'ProductCubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}
class Load extends ProductState {}
class Succ extends ProductState {}
class Err extends ProductState {
  final String err;

  Err({required this.err});
}
