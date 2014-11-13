$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'msgpack_responder/version'

Gem::Specification.new do |s|
  s.name        = 'msgpack_responder'
  s.version     = MsgpackResponder::VERSION
  s.authors     = ['Ryo Ameya']
  s.email       = ['oame@oameya.com']
  s.homepage    = 'https://github.com/oame/msgpack_responder'
  s.summary     = 'An active MessagePack responder for Rails4'
  s.description = 'An active MessagePack responder for Rails4'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.0'
end
