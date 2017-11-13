#-- Bootstrap --------------------------------------------------------------#

desc 'Initializes your working copy to run the specs'
task :bootstrap do
  if system('which bundle')
    title 'Installing gems'
    sh 'bundle install'

    title 'Updating submodules'
    sh 'git submodule update --init --recursive'
  else
    $stderr.puts "\033[0;31m" \
      "[!] Please install the bundler gem manually:\n" \
      '    $ [sudo] gem install bundler' \
      "\e[0m"
    exit 1
  end
end

begin
  require 'bundler/gem_tasks'
  require 'fileutils'

  task default: :spec

  #-- Specs ------------------------------------------------------------------#

  desc 'Run specs'
  task :spec do
  end

  #-- SourceKitten -----------------------------------------------------------#

  desc 'Vendors SourceKitten'
  task :sourcekitten do
    sk_dir = 'SourceKitten'
    Dir.chdir(sk_dir) do
      `swift build -c release -Xswiftc -static-stdlib`
    end
    build_dir = "#{sk_dir}/.build/release"
    FileUtils.cp_r Dir["#{build_dir}/{sourcekitten,*.dylib}"], 'bin'
    Dir["#{build_dir}/*.dylib"].each do |file|
      system 'install_name_tool', '-change', File.expand_path(file),
             "@loader_path/#{File.basename(file)}", 'bin/sourcekitten'
    end
    system 'install_name_tool', '-delete_rpath',
           (Pathname(`xcrun -find swift`) + '../../lib/swift/macosx').to_s,
           'bin/sourcekitten'
  end

rescue LoadError, NameError => e
  $stderr.puts "\033[0;31m" \
    '[!] Some Rake tasks haven been disabled because the environment' \
    ' couldn’t be loaded. Be sure to run `rake bootstrap` first.' \
    "\e[0m"
  $stderr.puts e.message
  $stderr.puts e.backtrace
  $stderr.puts
end

#-- Helpers ------------------------------------------------------------------#

def title(title)
  cyan_title = "\033[0;36m#{title}\033[0m"
  puts
  puts '-' * 80
  puts cyan_title
  puts '-' * 80
  puts
end
