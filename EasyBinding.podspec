Pod::Spec.new do |s|
  s.name             = 'EasyBinding'
  s.version          = '0.1.2'
  s.swift_version    = '5.0'
  s.summary          = 'A Simple and light way to perform a data binding.'
  s.description      = 'We know that you only need to bind your ViewModels to your views with the simplest way possible, here is how.'
  s.homepage         = 'https://github.com/mejiagarcia/EasyBinding'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Carlos Mejía' => 'carlosmejia083@gmail.com' }
  s.source           = { :git => 'https://github.com/mejiagarcia/EasyBinding.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/carlosmejia083'
  s.ios.deployment_target = '9.0'
  s.source_files = 'EasyBinding/Source/**/*'
end
