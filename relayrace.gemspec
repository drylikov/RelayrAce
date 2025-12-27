
Gem::Specification.new do |s|
  s.name = %q{relayrace}
  s.version = "1.0.2"
  s.date = %q{2025-12-25}
  s.authors = ["Denis Rylikov"]
  s.email = %q{denis.rylikov@protonmail.com}
  s.summary = %q{RelayrAce talks to Canakit USB relay boards.}
  s.description = %q{RelayrAce talks to Canakit USB relay boards.}
  s.files = [ "README", "LICENCE", "lib/relayrace.rb"]
  s.add_dependency('ruby-serialport')
  s.add_dependency('SystemTimer')
end