import UIKit

// MARK: - Toast (Main API)
public final class Toast {

    // MARK: - Shared
    public static let shared = Toast()
    private init() {}

    private var currentToast: ToastView?
    private var dismissTimer: Timer?

    // MARK: - Public Show Methods

    /// Show a success toast
    public static func success(_ message: String, config: ToastConfiguration = .default) {
        shared.show(message: message, type: .success, config: config)
    }

    /// Show an error toast
    public static func error(_ message: String, config: ToastConfiguration = .default) {
        shared.show(message: message, type: .error, config: config)
    }

    /// Show a warning toast
    public static func warning(_ message: String, config: ToastConfiguration = .default) {
        shared.show(message: message, type: .warning, config: config)
    }

    /// Show an info toast
    public static func info(_ message: String, config: ToastConfiguration = .default) {
        shared.show(message: message, type: .info, config: config)
    }

    /// Show a custom toast
    public static func show(_ message: String, type: ToastType, config: ToastConfiguration = .default) {
        shared.show(message: message, type: type, config: config)
    }

    // MARK: - Core Logic
    private func show(message: String, type: ToastType, config: ToastConfiguration) {
        DispatchQueue.main.async {
            self.dismissCurrent(animated: false)

            guard let window = self.keyWindow() else { return }

            let toast = ToastView(message: message, type: type, config: config)
            window.addSubview(toast)

            let horizontalInset: CGFloat = 24
            NSLayoutConstraint.activate([
                toast.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: horizontalInset),
                toast.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -horizontalInset)
            ])

            let safeArea = window.safeAreaInsets
            let offset: CGFloat = 16

            switch config.position {
            case .top:
                toast.topAnchor.constraint(
                    equalTo: window.topAnchor,
                    constant: safeArea.top + offset
                ).isActive = true
            case .bottom:
                toast.bottomAnchor.constraint(
                    equalTo: window.bottomAnchor,
                    constant: -(safeArea.bottom + offset + 80)
                ).isActive = true
            }

            window.layoutIfNeeded()

            // Animate IN
            let translateY: CGFloat = config.position == .top ? -120 : 120
            toast.transform = CGAffineTransform(translationX: 0, y: translateY)
            toast.alpha = 0

            UIView.animate(
                withDuration: config.animationDuration,
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.5,
                options: .curveEaseOut
            ) {
                toast.transform = .identity
                toast.alpha = 1
            }

            self.currentToast = toast

            // Auto dismiss
            self.dismissTimer?.invalidate()
            self.dismissTimer = Timer.scheduledTimer(
                withTimeInterval: config.duration,
                repeats: false
            ) { [weak self] _ in
                self?.dismissCurrent(animated: true, config: config)
            }

            // Tap to dismiss
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
            toast.addGestureRecognizer(tap)
        }
    }

    @objc private func handleTap() {
        dismissCurrent(animated: true)
    }

    private func dismissCurrent(animated: Bool, config: ToastConfiguration = .default) {
        dismissTimer?.invalidate()
        dismissTimer = nil

        guard let toast = currentToast else { return }
        currentToast = nil

        if animated {
            UIView.animate(
                withDuration: config.animationDuration,
                animations: {
                    toast.alpha = 0
                    toast.transform = CGAffineTransform(translationX: 0, y: 40)
                },
                completion: { _ in toast.removeFromSuperview() }
            )
        } else {
            toast.removeFromSuperview()
        }
    }

    // MARK: - Helpers
    private func keyWindow() -> UIWindow? {
        if #available(iOS 15.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        }
    }
}
