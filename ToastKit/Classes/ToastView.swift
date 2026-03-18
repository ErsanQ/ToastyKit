import UIKit

// MARK: - ToastView
final class ToastView: UIView {

    // MARK: - UI Elements
    private let iconLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Init
    init(message: String, type: ToastType, config: ToastConfiguration) {
        super.init(frame: .zero)
        setup(message: message, type: type, config: config)
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Setup
    private func setup(message: String, type: ToastType, config: ToastConfiguration) {
        backgroundColor = type.backgroundColor
        layer.cornerRadius = config.cornerRadius
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false

        // Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 8
        layer.masksToBounds = false

        iconLabel.text = type.icon

        messageLabel.text = message
        messageLabel.font = .systemFont(ofSize: config.fontSize, weight: .medium)
        messageLabel.textColor = type.textColor

        stackView.addArrangedSubview(iconLabel)
        stackView.addArrangedSubview(messageLabel)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: config.verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -config.verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: config.horizontalPadding),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -config.horizontalPadding)
        ])
    }
}
