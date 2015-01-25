Pod::Spec.new do |s|
  s.name         = 'MGTextView'
  s.version      = '1.0'
  s.summary      = 'MGTextView extends UITextView fixing the Apple bugs and offering a couple of useful functionalities.'
  s.homepage     = 'https://github.com/matteogobbi/MGTextView'
  s.license      = { :type => 'MIT',
                     :file => 'LICENSE' }
  s.author       = { 'Matteo Gobbi' => 'job@matteogobbi.com' }
  s.source       = { :git => 'https://github.com/matteogobbi/MGTextView.git',
                     :tag => '1.0' }
  s.platform     = :ios, '6.0'
  s.source_files = 'MGTextView/*.{h,m}'
  s.frameworks   = 'UIKit'
  s.requires_arc = true
end