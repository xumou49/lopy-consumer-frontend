part of 'payment_method_selector_cubit.dart';

abstract class PaymentMethodSelectorState<T> extends Equatable {
  final String type;
  final T? data;

  const PaymentMethodSelectorState({
    this.type = "",
    this.data,
  });

  @override
  List<Object?> get props => [data];
}

class EmptyMethodSelector extends PaymentMethodSelectorState {
  const EmptyMethodSelector({super.type, super.data});
}

class CreditCardMethodSelector extends PaymentMethodSelectorState {
  const CreditCardMethodSelector({super.type, super.data});
}

class PaynowMethodSelector extends PaymentMethodSelectorState {
  const PaynowMethodSelector({super.type, super.data});
}

class PaypalMethodSelector extends PaymentMethodSelectorState {
  const PaypalMethodSelector({super.type, super.data});
}
