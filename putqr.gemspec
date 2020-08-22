lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'putqr/version'

Gem::Specification.new do |s|
  s.name        = 'putqr'
  s.version     = PutQR::VERSION
  s.date        = PutQR::DATE
  s.license     = 'MIT'

  s.summary     = 'Displays a QR code in your terminal.'
  s.description = 'putqr displays a QR code in your terminal.'

  s.authors     = ['Liam Cooke']
  s.email       = 'putqr@liamcooke.com'
  s.homepage    = 'https://liamcooke.com/code/putqr/'
  s.metadata    = {
    # 'bug_tracker_uri' => '',
    'changelog_uri' => 'https://git.sr.ht/~ljc/putqr/tree/main/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/putqr',
    'homepage_uri' => 'https://liamcooke.com/code/putqr/',
    'source_code_uri' => 'https://git.sr.ht/~ljc/putqr',
  }

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
