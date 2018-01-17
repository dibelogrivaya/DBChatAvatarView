Pod::Spec.new do |s|
  s.name             = "DBChatAvatarView"
  s.version          = "1.2"
  s.summary          = "Group avatar for chat."

  s.homepage         = "https://github.com/dibelogrivaya"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Diana Belogrivaya" => "diana.belogrivaya@gmail.com" }
  s.source           = { :http => 'https://github.com/dibelogrivaya/DBChatAvatarView.git' }
  s.requires_arc     = true
  s.source_files     = 'DBChatAvatarView'
  s.platform         = :ios, "8.0"

  s.dependency 'UIColor+Hex'
end