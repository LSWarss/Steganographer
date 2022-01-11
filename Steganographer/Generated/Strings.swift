// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {

  internal enum CardViewType {
    internal enum Title {
      /// Decoding
      internal static let decoding = Strings.tr("Loc", "CardViewType.Title.Decoding")
      /// Encoding
      internal static let encoding = Strings.tr("Loc", "CardViewType.Title.Encoding")
      /// History
      internal static let history = Strings.tr("Loc", "CardViewType.Title.History")
      /// Information
      internal static let information = Strings.tr("Loc", "CardViewType.Title.Information")
    }
  }

  internal enum Home {
    internal enum Header {
      /// Hello there,
      /// 
      internal static let firstPart = Strings.tr("Loc", "Home.Header.FirstPart")
      /// are there anything we can help you with?
      internal static let secondPart = Strings.tr("Loc", "Home.Header.SecondPart")
    }
    internal enum Row {
      internal enum Steganography {
        /// Steganography
        internal static let title = Strings.tr("Loc", "Home.Row.Steganography.Title")
      }
    }
  }

  internal enum Steganography {
    internal enum Decoding {
      /// Decoding
      internal static let title = Strings.tr("Loc", "Steganography.Decoding.Title")
    }
    internal enum Encoding {
      /// Click here to pick an image from
      /// 
      internal static let bottomPickerButton1 = Strings.tr("Loc", "Steganography.Encoding.BottomPickerButton1")
      /// Photos
      internal static let bottomPickerButton2 = Strings.tr("Loc", "Steganography.Encoding.BottomPickerButton2")
      ///  or 
      internal static let bottomPickerButton3 = Strings.tr("Loc", "Steganography.Encoding.BottomPickerButton3")
      /// Files
      internal static let bottomPickerButton4 = Strings.tr("Loc", "Steganography.Encoding.BottomPickerButton4")
      /// Click here to make a photo with
      /// 
      internal static let camerPickerButton1 = Strings.tr("Loc", "Steganography.Encoding.CamerPickerButton1")
      /// Camera
      internal static let camerPickerButton2 = Strings.tr("Loc", "Steganography.Encoding.CamerPickerButton2")
      /// Here you can
      internal static let headerText1 = Strings.tr("Loc", "Steganography.Encoding.HeaderText1")
      ///  hide 
      internal static let headerText2 = Strings.tr("Loc", "Steganography.Encoding.HeaderText2")
      /// your message in the image, right from your photos library or camera :)
      internal static let headerText3 = Strings.tr("Loc", "Steganography.Encoding.HeaderText3")
      /// Encoding
      internal static let title = Strings.tr("Loc", "Steganography.Encoding.Title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
