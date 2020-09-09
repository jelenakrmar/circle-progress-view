#
# Be sure to run `pod lib lint BOCircleProgressView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BOCircleProgressView'
  s.version          = '1.0.0'
  s.summary          = 'A circular progress indicator.'

  s.description      = <<-DESC
  BOCircleProgressView is used to display completion percentage in a circular (ring-like) component.
  You can change the color, size and with of the circular progress indicator and initialize it either from Storyboard or from the code.
                       DESC

  s.homepage         = 'https://github.com/jelenakrmar/circle-progress-view'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jelenakrmar' => 'https://github.com/jelenakrmar' }
  s.source           = { :git => 'https://github.com/jelenakrmar/circle-progress-view.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'BOCircleProgressView/Classes/*'
  s.swift_version = "4.0"
  
end
