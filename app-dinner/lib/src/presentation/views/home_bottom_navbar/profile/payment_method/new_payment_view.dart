import 'package:Lopy/src/presentation/cubits/user_card/user_card_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/button_widget.dart';
import 'package:Lopy/src/presentation/widgets/payment_method/new_payment_textfield_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:oktoast/oktoast.dart';

import '../../../../widgets/common/appbar_widget.dart';

enum CardType {
  Master,
  Visa,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Others,
  Invalid
}

@RoutePage()
class NewPaymentMethodView extends StatefulWidget {
  final String type;

  const NewPaymentMethodView({super.key, required this.type});

  @override
  State<NewPaymentMethodView> createState() => _NewPaymentMethodViewState();
}

class _NewPaymentMethodViewState extends State<NewPaymentMethodView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCardCubit, UserCardState>(
        listener: (context, state) {
          if (state is UserCardSuccess) {
            context.router.pop();
            showToast("Card Added!");
          } else {
            showToast("Fail to add card!");
          }
        },
        child: Scaffold(
          appBar: const GradientAppBar(title: "Add Card"),
          body: Container(
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: 20.0, right: 20.0, bottom: 30.0),
              child: UserCardForm(),
            ),
          ),
        ));
  }
}

class UserCardForm extends StatefulWidget {
  const UserCardForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserCardFormState();
  }
}

class UserCardFormState extends State<UserCardForm> {
  TextEditingController cardNumberController = TextEditingController();

  CardType cardType = CardType.Invalid;

  final _formKey = GlobalKey<FormState>();

  String cardNumber = "";
  String cardHolderName = "";
  String expMonth = "";
  String expYear = "";
  String cvc = "";

  @override
  void initState() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                NewPaymentTextFieldWidget(
                  title: "CARD NUMBER",
                  placeholder: "Enter card number",
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(19),
                    CardNumberInputFormatter(),
                  ],
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: CardUtils.getCardIcon(cardType),
                  ),
                  validator: (value) {
                    return CardUtils.validateCardNum(value);
                  },
                  onSaved: (String value) {
                    cardNumber = value;
                  },
                ),
                NewPaymentTextFieldWidget(
                  title: "CARD HOLDER NAME",
                  placeholder: "Enter full name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    cardHolderName = value;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: NewPaymentTextFieldWidget(
                        title: "EXPIRED DATE",
                        placeholder: "MM/YY",
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          CardMonthInputFormatter(),
                        ],
                        validator: (value) {
                          return CardUtils.validateDate(value);
                        },
                        onSaved: (String value) {
                          if (value.contains(RegExp(r'(/)'))) {
                            var split = value.split(RegExp(r'(/)'));
                            expMonth = split[0];
                            expYear = split[1];
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: NewPaymentTextFieldWidget(
                        title: "CVC",
                        placeholder: "***",
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        validator: (value) {
                          return CardUtils.validateCVC(value);
                        },
                        onSaved: (String value) {
                          cvc = value;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                ButtonWidget(
                    text: "ADD & MAKE PAYMENT",
                    onPressed: () async {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        showToast("All Clear!");
                        print(
                            "$cardNumber $cardHolderName $expMonth $expYear $cvc");

                        await Stripe.instance
                            .dangerouslyUpdateCardDetails(CardDetails(
                          number: cardNumber,
                          cvc: cvc,
                          expirationMonth: int.parse(expMonth),
                          expirationYear: int.parse(expYear),
                        ));

                        CardTokenParams tokenParams = CardTokenParams(
                          name: cardHolderName,
                        );

                        final token = await Stripe.instance.createToken(
                          CreateTokenParams.card(params: tokenParams),
                        );

                        if (!context.mounted) {
                          return;
                        }
                        var userCard = context
                            .read<UserCardCubit>()
                            .saveUserCard(token.id);
                        print(token.toString());
                      }
                    }),
              ],
            ))
      ],
    );
  }

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardUtils {
  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.Master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CardType.AmericanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = CardType.Discover;
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CardType.DinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CardType.Jcb;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }

  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.Master:
        img = 'mastercard.png';
        break;
      case CardType.Visa:
        img = 'visa.png';
        break;
      case CardType.AmericanExpress:
        img = 'american_express.png';
        break;
      case CardType.Discover:
        img = 'discover.png';
        break;
      case CardType.DinersClub:
        img = 'diners_club.png';
        break;
      case CardType.Jcb:
        img = 'jcb.png';
        break;
      case CardType.Others:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'lib/src/assets/images/$img',
        width: 24.0,
        height: 24.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return "This field is required";
    }
    input = getCleanedNumber(input);
    if (input.length < 8) {
      return "Card is invalid";
    }
    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);
// every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }
    if (sum % 10 == 0) {
      return null;
    }
    return "Card is invalid";
  }

  static String? validateCVC(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (value.length < 3 || value.length > 4) {
      return "CVC is invalid";
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    int year;
    int month;
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));

      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }
    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }
    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }
    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }
}
