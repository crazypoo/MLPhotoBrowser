Pod::Spec.new do |s|
  s.name             = "MLPhotoBrowser"
  s.version          = "0.1.0"
  s.summary          = "A simple iOS Photo browser Library, Support optional animation."
  s.homepage         = "https://github.com/MakeZL/MLPhotoBrowser"
  s.license          = 'MIT'
  s.author           = { "zhangleo" => "zhangleowork@163.com" }
  s.source           = { :git => "https://github.com/MakeZL/MLPhotoBrowser.git", :tag => s.version.to_s }

  s.platform     =  :ios, '6.0'
  s.requires_arc =  true

  s.frameworks   =  'AssetsLibrary'
  s.source_files =  'MLPhotoBrowser/Classes/**/*'
  s.resource     =  "MLPhotoBrowser/MLPhotoBrowser.bundle"
  s.dependency      'SDWebImage', '~> 3.7'
  s.dependency      'DACircularProgress'
end
