Pod::Spec.new do |s|
  s.name         = "UIDataManager"
  s.version      = "0.1"
  s.summary      = "Declarative UI data management"
  s.homepage     = "https://github.com/noxt/UIDataManager"
  s.license      = 'MIT'
  s.author       = { "Ivanenko Dmitry" => "id.noxt@gmail.com" }
  s.platform     = :ios, '9.0'
  s.source       = { :git => "https://github.com/noxt/UIDataManager.git", :tag => "0.1" }
  s.source_files = 'UIDataManagerKit/*.swift'
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
end
