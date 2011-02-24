$:.unshift 'lib'

task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test' << '.'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -r ./lib/dotblock_api.rb -I ./lib"
end

require 'sdoc_helpers'
desc "Push a new version to Gemcutter"
task :publish do
  require 'dotblock_api/version'

  ver = DotBlockAPI::Version

  sh "gem build dotblock-api.gemspec"
  sh "gem push dotblock-api-#{ver}.gem"
  sh "git tag -a -m 'DotBlockAPI v#{ver}' v#{ver}"
  sh "git push origin v#{ver}"
  sh "git push origin master"
  sh "git clean -fd"
  sh "rake pages"
end
