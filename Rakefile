task :default => 'test'

task :gem => 'euler31.gemspec' do
  sh 'gem build *.gemspec'
end

task :install => [:gem] do
  sh 'gem install ./*.gem'
end
