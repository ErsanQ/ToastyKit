import UIKit

// MARK: - Toast Type
public enum ToastType {
    case success
    case error
    case warning
    case info

    var icon: String {
        switch self {
        case .success: return "✅"
        case .error:   return "❌"
        case .warning: return "⚠️"
        case .info:    return "ℹ️"
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .success: return UIColor(red: 0.18, green: 0.80, blue: 0.44, alpha: 1)
        case .error:   return UIColor(red: 0.91, green: 0.30, blue: 0.24, alpha: 1)
        case .warning: return UIColor(red: 0.95, green: 0.77, blue: 0.06, alpha: 1)
        case .info:    return UIColor(red: 0.20, green: 0.60, blue: 0.86, alpha: 1)
        }
    }

    var textColor: UIColor {
        switch self {
        case .warning: return UIColor(white: 0.15, alpha: 1)
        default:       return .white
        }
    }
}

// MARK: - Toast Position
public enum ToastPosition {
    case top
    case bottom
}

// MARK: - Toast Configuration
public struct ToastConfiguration {
    public var duration: TimeInterval
    public var position: ToastPosition
    public var cornerRadius: CGFloat
    public var fontSize: CGFloat
    public var horizontalPadding: CGFloat
    public var verticalPadding: CGFloat
    public var animationDuration: TimeInterval

    public static var `default` = ToastConfiguration(
        duration: 3.0,
        position: .bottom,
        cornerRadius: 14,
        fontSize: 15,
        horizontalPadding: 20,
        verticalPadding: 12,
        animationDuration: 0.35
    )

    public init(
        duration: TimeInterval = 3.0,
        position: ToastPosition = .bottom,
        cornerRadius: CGFloat = 14,
        fontSize: CGFloat = 15,
        horizontalPadding: CGFloat = 20,
        verticalPadding: CGFloat = 12,
        animationDuration: TimeInterval = 0.35
    ) {
        self.duration = duration
        self.position = position
        self.cornerRadius = cornerRadius
        self.fontSize = fontSize
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.animationDuration = animationDuration
    }
}
