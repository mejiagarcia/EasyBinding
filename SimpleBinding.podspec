Pod::Spec.new do |s|
  s.name             = 'SimpleBinding'
  s.version          = '0.2.0'
  s.swift_version    = '5.0'
  s.summary          = 'A Simple and light way to perform a data binding.'
  s.description      = 'We know that you only need to bind your ViewModels to your views with the simplest way possible, here is how.'
  s.homepage         = 'https://github.com/mejiagarcia/simple-binding'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Carlos Mejía' => 'luiscarlos083@hotmail.com' }
  s.source           = { :git => 'https://github.com/mejiagarcia/simple-binding.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.instagram.com/carlosmejia083/'
  s.ios.deployment_target = '9.0'
  s.source_files = 'SimpleBinding/SimpleBinding/**/*'
end
