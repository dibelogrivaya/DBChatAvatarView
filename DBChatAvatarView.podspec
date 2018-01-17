Pod::Spec.new do |s|
  s.name             = "DBChatAvatarView"
  s.version          = "1.1"
  s.summary          = "Group avatar for chat."
  s.homepage         = "https://github.com/dibelogrivaya"
  s.license          = 'MIT'
  s.author           = { "Diana Belogrivaya" => "diana.belogrivaya@gmail.com" }
  s.source           = { :http => "https://github.com/dibelogrivaya/DBChatAvatarSample.git", :tag => s.version.to_s }
  s.requires_arc     = true
  s.source_files     = 'DBChatAvatarView'
  s.ios.deployment_target = '8.0'
  s.dependency 'UIColor+Hex'
end