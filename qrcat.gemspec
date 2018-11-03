Gem::Specification.new do |s|
  s.name        = 'qrcat'
  s.version     = '0.1.0'
  s.date        = '2018-11-03'
  s.license     = 'MIT'

  s.summary     = 'Renders a QR code from standard input.'
  s.description = 'qrcat renders a QR code from standard input.'

  s.authors     = ['Liam Cooke']
  s.email       = 'qrcat@liamcooke.com'
  s.homepage    = 'https://github.com/ljcooke/qrcat'

  s.files       = ['bin/qrcat', 'lib/qrcat.rb']
  s.executables = ['qrcat']

  s.add_runtime_dependency 'rqrcode'
end
