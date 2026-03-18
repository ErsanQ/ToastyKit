Pod::Spec.new do |s|
  s.name             = 'ToastKit'
  s.version          = '1.0.0'
  s.summary          = 'Lightweight and beautiful toast notifications for iOS.'

  s.description      = <<-DESC
    ToastKit is a simple, elegant, and fully customizable toast notification library for iOS.
    Show success, error, warning, and info messages with smooth animations.
    Supports both UIKit and SwiftUI.
  DESC

  s.homepage         = 'https://github.com/ErsanQ/ToastKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ersan' => 'ersan5599@gmail.com' }
  s.source           = { :git =>
  'https://github.com/ErsanQ/ToastKit.git',
   :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.0'

  s.source_files     = 'ToastKit/Classes/**/*'
  s.frameworks       = 'UIKit'
end
