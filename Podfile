source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Artsy/Specs.git'

platform :ios, '13.0'
inhibit_all_warnings!

target 'Movies' do
  pod 'Kingfisher', '~> 7.0'
  # Has its own copy of OCMock
  # and has access to GoogleAnalytics via the app
  # that hosts the test target
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts target.name
  end
end
