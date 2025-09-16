// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Auth {
    /// Войти
    internal static let action = L10n.tr("Localizable", "auth.action", fallback: "Войти")
    /// E-mail
    internal static let email = L10n.tr("Localizable", "auth.email", fallback: "E-mail")
    /// Пароль
    internal static let password = L10n.tr("Localizable", "auth.password", fallback: "Пароль")
    /// Авторизация
    internal static let title = L10n.tr("Localizable", "auth.title", fallback: "Авторизация")
  }
  internal enum Forgetpassword {
    /// Электронная почта
    internal static let name = L10n.tr("Localizable", "forgetpassword.name", fallback: "Электронная почта")
    /// Авторизация
    internal static let title = L10n.tr("Localizable", "forgetpassword.title", fallback: "Авторизация")
  }
  internal enum Placeholder {
    /// Нет соединения
    internal static let noConnection = L10n.tr("Localizable", "placeholder.noConnection", fallback: "Нет соединения")
    /// Обновить
    internal static let refresh = L10n.tr("Localizable", "placeholder.refresh", fallback: "Обновить")
    /// Что-то пошло не так
    internal static let unknown = L10n.tr("Localizable", "placeholder.unknown", fallback: "Что-то пошло не так")
  }
  internal enum Profile {
    /// Выйти
    internal static let logout = L10n.tr("Localizable", "profile.logout", fallback: "Выйти")
    /// Профиль
    internal static let title = L10n.tr("Localizable", "profile.title", fallback: "Профиль")
    internal enum Logout {
      /// Выйти
      internal static let action = L10n.tr("Localizable", "profile.logout.action", fallback: "Выйти")
    }
  }
  internal enum Registration {
    /// Зарегистрироваться
    internal static let action = L10n.tr("Localizable", "registration.action", fallback: "Зарегистрироваться")
    /// E-mail
    internal static let name = L10n.tr("Localizable", "registration.name", fallback: "E-mail")
    /// Авторизация
    internal static let title = L10n.tr("Localizable", "registration.title", fallback: "Авторизация")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
