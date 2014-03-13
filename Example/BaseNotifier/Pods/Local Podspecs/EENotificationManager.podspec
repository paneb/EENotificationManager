Pod::Spec.new do |s|
  s.name             = "EENotificationManager"
  s.version          = "0.0.2-beta1"
  s.summary          = "Simple Library To Centralize Event Management"
  s.description      = <<-DESC
                       Simple Library To Centralize Event Management

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/paneb/EENotificationManager.git"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Francesco Cabras" => "paneb.devel@gmail.com" }
  s.source           = { :git => "https://github.com/paneb/EENotificationManager.git", :tag => 'v0.0.2-beta1' }
  s.social_media_url = 'https://twitter.com/fcabras'
  s.source_files = 'Classes/ios'
  
  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.resources = 'Resources'

  s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
