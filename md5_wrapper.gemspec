Gem::Specification.new do |s|
  # Project
  s.name         = 'md5_wrapper'
  s.summary      = "Md5Wrapper wraps the command line utilities md5sum (Linux) and md5 (Mac)."
  s.description  = "It allows obtaining the md5 hexdigest of a file and checking that a file has a specific md5 hexdigest."
  s.version      = '0.3.0'
  s.date         = '2008-08-05'
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Wes Oldenbeuving"]
  s.email        = "narnach@gmail.com"
  s.homepage     = "http://www.github.com/Narnach/md5_wrapper"
  
  # Files
  s.require_path = "lib"
  s.files        = ['md5_wrapper.gemspec', 'MIT-LICENSE', 'README.rdoc', 'Rakefile', 'init.rb', 'lib/md5_wrapper.rb', 'test/md5_wrapper_test.rb', 'test/fixtures/test.txt']
  s.test_files   = ['test/md5_wrapper_test.rb']

  # rdoc
  s.has_rdoc         = true
  s.extra_rdoc_files = %w[ README.rdoc MIT-LICENSE]
  s.rdoc_options << '--inline-source' << '--line-numbers' << '--main' << 'README.rdoc'

  # Requirements
  s.required_ruby_version = ">= 1.8.0"
end
