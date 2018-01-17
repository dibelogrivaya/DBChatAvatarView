Pod::Spec.new do |s|
  s.name             = "DBChatAvatarView"
  s.version          = "1.3"
  s.summary          = "Group avatar for chat."

  s.homepage         = "https://github.com/dibelogrivaya"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Diana Belogrivaya" => "diana.belogrivaya@gmail.com" }
  s.source           = { :http => 'https://github.com/dibelogrivaya/DBChatAvatarView/archive/1.3.tar.gz' }
  s.requires_arc     = true

  s.source_files  = ['DBChatAvatarView/*.{h,m}']
  s.platforms     = { :ios => "8.0" }

  s.dependency 'UIColor+Hex'
end