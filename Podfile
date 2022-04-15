source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'

workspace 'UniversalSDKSwift'
project 'UniversalSDKSwift/UniversalSDKSwift.xcodeproj'
project 'UniversalSDKDemo/UniversalSDKDemo.xcodeproj'

target 'UniversalSDKSwift' do

	project 'UniversalSDKSwift/UniversalSDKSwift.xcodeproj'
  
  use_frameworks! :linkage => :static
  pod 'GoogleSignIn', '~> 6.1.0'
  pod 'FBSDKLoginKit', '~> 11.0'
end

target 'UniversalSDKDemo' do

	project 'UniversalSDKDemo/UniversalSDKDemo.xcodeproj'
	pod 'SnapKit', '~> 5.0.0'
end
