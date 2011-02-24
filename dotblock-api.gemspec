$LOAD_PATH.unshift 'lib'

require 'dotblock_api/version'

Gem::Specification.new do |s|
  s.name             = 'dotblock-api'
  s.version          = DotBlockAPI::Version
  s.date             = Time.now.strftime('%Y-%m-%d')
  s.summary          = 'DotBlock API: A Ruby client for api.dotblock.com'
  s.homepage         = 'http://github.com/dotblock/dotblock-api-ruby'
  s.authors          = ['Joshua Priddle']
  s.email            = 'jpriddle@nevercraft.net'

  s.files            = %w[ Rakefile README.markdown ]
  # s.files           += Dir['bin/**/*']
  s.files           += Dir['lib/**/*']
  s.files           += Dir['test/**/*']

  # s.executables      = ['dotblock-api']

  s.add_dependency('json', '= 1.4.6')

  s.add_development_dependency('shoulda')

  s.extra_rdoc_files = ['README.markdown']
  s.rdoc_options     = ["--charset=UTF-8"]

  s.description = <<-DESC
    DotBlock API: A Ruby client for api.dotblock.com
  DESC
end
