import SwiftUI

// MARK: - SwiftUI Support
@available(iOS 14.0, *)
public extension View {

    /// Show a toast from any SwiftUI view
    func toast(
        isPresented: Binding<Bool>,
        message: String,
        type: ToastType = .info,
        config: ToastConfiguration = .default
    ) -> some View {
        onChange(of: isPresented.wrappedValue) { presented in
            if presented {
                Toast.show(message, type: type, config: config)
                isPresented.wrappedValue = false
            }
        }
    }
}
