Pod::Spec.new do |spec|
  spec.name         = 'EENotificationManager'
  spec.version      = '0.0.3-beta3'
  spec.license      = 'MIT'
  spec.summary      = 'Simple Library To Centralize Event Management'
  spec.homepage     = 'https://github.com/paneb/EENotificationManager'
  spec.author       = 'Luke Redpath'
  spec.source       =  {:git => "https://github.com/paneb/EENotificationManager.git", :tag => "#{spec.version}"}
  spec.source_files = 'Classes/*'
  spec.requires_arc = true
end
