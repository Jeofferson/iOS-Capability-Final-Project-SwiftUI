// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Localizable.strings
  ///   iOS Capability Final Project (SwiftUI)
  /// 
  ///   Created by Jeofferson Dela Pena on 10/5/22.
  internal static let appTitle = L10n.tr("Localizable", "appTitle", fallback: "Shoppy")
  /// https://fakestoreapi.com
  internal static let baseURL = L10n.tr("Localizable", "baseURL", fallback: "https://fakestoreapi.com")
  internal enum Confirm {
    /// OK
    internal static let ok = L10n.tr("Localizable", "confirm.ok", fallback: "OK")
  }
  internal enum Icon {
    /// cart.fill.badge.plus
    internal static let addToCart = L10n.tr("Localizable", "icon.addToCart", fallback: "cart.fill.badge.plus")
    /// cart.fill
    internal static let insideCart = L10n.tr("Localizable", "icon.insideCart", fallback: "cart.fill")
    /// cart
    internal static let notInsideCart = L10n.tr("Localizable", "icon.notInsideCart", fallback: "cart")
    /// cart.fill.badge.minus
    internal static let removeFromCart = L10n.tr("Localizable", "icon.removeFromCart", fallback: "cart.fill.badge.minus")
    internal enum TabView {
      /// cart.fill
      internal static let cart = L10n.tr("Localizable", "icon.tabView.cart", fallback: "cart.fill")
      /// bag.fill
      internal static let shop = L10n.tr("Localizable", "icon.tabView.shop", fallback: "bag.fill")
    }
  }
  internal enum Sample {
    internal enum Product {
      /// https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
      internal static let imageURLString = L10n.tr("Localizable", "sample.product.imageURLString", fallback: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")
      /// Sample Product
      internal static let name = L10n.tr("Localizable", "sample.product.name", fallback: "Sample Product")
    }
  }
  internal enum Title {
    /// Added to cart!
    internal static let addedToCart = L10n.tr("Localizable", "title.addedToCart", fallback: "Added to cart!")
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
