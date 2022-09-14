abstract class ListenableUseCase<Type> {
  Stream<Type> call();
}
