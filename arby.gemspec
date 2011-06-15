Gem::Specification.new do |s|
  s.name = "arbybot"
  s.version = "0.0.1"
  s.summary = "IRC bot for sonian website hax0rs"
  s.author = "sonians"
  s.email = "website@sonian.net"
  s.homepage = "http://github.com/jwinter/arbybot"
  s.description = s.summary
  s.add_dependency('isaac','~> 0.2.6')
  s.add_dependency('httparty','~> 0.7.8')
  s.bindir = '.'
  s.executables = ['arby.rb']
  s.require_path = 'lib'
  s.files = ['arby.rb', 'config.example.rb']
end
