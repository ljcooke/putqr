lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'putqr/version'

Gem::Specification.new do |s|
  s.name        = 'putqr'
  s.version     = PutQR::VERSION
  s.date        = '2018-11-03'
  s.license     = 'MIT'

  s.summary     = 'Displays a QR code in your terminal.'
  s.description = 'putqr displays a QR code in your terminal.'

  s.authors     = ['Liam Cooke']
  s.email       = 'putqr@liamcooke.com'
  s.homepage    = 'https://github.com/ljcooke/putqr'

  s.executables = ['putqr']

  s.files = [
    'LICENSE',
    'README.md',
    'bin/putqr',
    'lib/putqr.rb',
    'lib/putqr/version.rb',
  ]

  s.add_runtime_dependency 'rqrcode', '~> 0.10.1'
end
