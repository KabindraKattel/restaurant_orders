import 'package:reactive_forms/reactive_forms.dart';
import 'package:validators/validators.dart';

class CustomValidators extends Validators {
  static ValidatorFunction get url => URLValidator().validate;
}

class CustomValidationMessage implements ValidationMessage {
  static String url = 'url';
}

class URLValidator extends Validator<dynamic> {
  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = <String, dynamic>{CustomValidationMessage.url: true};

    if (control.value == null) {
      return null;
    } else if (control.value is String) {
      return !isURL((control.value as String).trim()) ? error : null;
    }

    return null;
  }
}
