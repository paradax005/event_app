import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/core/errors/failures.dart';
import 'package:event_app/global/translation/generated/locale_keys.g.dart';

String mapFailureToString(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure _:
      return LocaleKeys.server_internal_exception.tr();
    case ConnexionFailure _:
      return LocaleKeys.server_internet_exception.tr();
    case WrongEmailOrPassword _:
      return LocaleKeys.server_credentials_exception.tr();
    case UserExistFailure _:
      return LocaleKeys.server_customer_exist_exception.tr();
    default:
      return LocaleKeys.server_unexpected_exception.tr();
  }
}
