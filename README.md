# 🍞 ToastKit

[![Version](https://img.shields.io/cocoapods/v/ToastKit.svg?style=flat)](https://cocoapods.org/pods/ToastKit)
[![License](https://img.shields.io/cocoapods/l/ToastKit.svg?style=flat)](https://cocoapods.org/pods/ToastKit)
[![Platform](https://img.shields.io/cocoapods/p/ToastKit.svg?style=flat)](https://cocoapods.org/pods/ToastKit)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)

Lightweight and beautiful toast notifications for iOS. Supports UIKit and SwiftUI.

---

## ✨ Features

- ✅ 4 toast types: **Success**, **Error**, **Warning**, **Info**
- 🎨 Smooth spring animations
- 📍 Top or Bottom position
- 🔧 Fully customizable (duration, corner radius, font size, and more)
- 📱 SwiftUI & UIKit support
- 💡 Tap to dismiss
- 🔒 Thread-safe (always dispatches to main thread)

---

## 📦 Installation

### CocoaPods

Add to your `Podfile`:

```ruby
pod 'ToastKit', '~> 1.0.0'
```

Then run:

```bash
pod install
```

---

## 🚀 Usage

### UIKit

```swift
import ToastKit

// Simple usage
Toast.success("تم الحفظ بنجاح!")
Toast.error("حدث خطأ ما")
Toast.warning("انتبه من هذا الإجراء")
Toast.info("تحديث جديد متاح")
```

### Custom Configuration

```swift
var config = ToastConfiguration.default
config.position = .top
config.duration = 4.0
config.cornerRadius = 20

Toast.success("تم تحديث البيانات!", config: config)
```

### SwiftUI

```swift
import SwiftUI
import ToastKit

struct ContentView: View {
    @State private var showToast = false

    var body: some View {
        Button("Show Toast") {
            showToast = true
        }
        .toast(
            isPresented: $showToast,
            message: "تم الحفظ بنجاح!",
            type: .success
        )
    }
}
```

---

## ⚙️ Configuration Options

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `duration` | `TimeInterval` | `3.0` | How long the toast is shown |
| `position` | `ToastPosition` | `.bottom` | `.top` or `.bottom` |
| `cornerRadius` | `CGFloat` | `14` | Corner radius of the toast |
| `fontSize` | `CGFloat` | `15` | Font size of the message |
| `horizontalPadding` | `CGFloat` | `20` | Inner horizontal padding |
| `verticalPadding` | `CGFloat` | `12` | Inner vertical padding |
| `animationDuration` | `TimeInterval` | `0.35` | Slide animation speed |

---

## 📋 Requirements

- iOS 13.0+
- Swift 5.0+
- Xcode 13+

---

## 📄 License

ToastKit is available under the MIT license. See the LICENSE file for more info.
