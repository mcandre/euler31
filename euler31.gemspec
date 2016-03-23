Gem::Specification.new { |s|
  s.name = 'euler31'
  s.summary = 'a brute force solution to Project Euler #31'
  s.description = 'see README.md for details'
  s.license = 'FreeBSD'

  s.version = '0.0.0'

  s.authors = ['Andrew Pennebaker']
  s.email = 'andrew.pennebaker@gmail.com'

  s.executables = ['euler31']

  s.files = Dir['lib/*.rb']
  s.homepage = 'https://github.com/mcandre/euler31'

  s.required_ruby_version = '>= 2.0'

  s.add_dependency 'multiset', '0.5.1'
}
