Gem::Specification.new do |s|
  s.name        = 'putqr'
  s.version     = '0.1.0'
  s.date        = '2018-11-03'
  s.license     = 'MIT'

  s.summary     = 'Displays a QR code in your terminal.'
  s.description = 'putqr displays a QR code in your terminal.'

  s.authors     = ['Liam Cooke']
  s.email       = 'putqr@liamcooke.com'
  s.homepage    = 'https://github.com/ljcooke/putqr'

  s.files       = ['bin/putqr', 'lib/putqr.rb']
  s.executables = ['putqr']

  s.add_runtime_dependency 'rqrcode', '~> 0.10.1'
end
