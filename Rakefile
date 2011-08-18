require 'fileutils'

task :default => [:create_symlinks]

def check_symlink(source, dest)
  if File.exists?(dest)
    if File.symlink?(dest)
      current_link = File.readlink(dest)
      if current_link != source
        puts "#{dest} already exists and points to #{current_link}"
      else
        puts "ok #{dest} -> #{source}"
      end
    else
      puts "#{dest} already exists and and is not a symlink"
    end
  else
    File.symlink(source, dest)
    puts "created #{dest} -> #{source}"
  end
end

desc 'Symlink config files at the right locations.'
task :create_symlinks do
  FileUtils.mkdir_p(File.expand_path('~/bin'))

  Hash[*%w{
    .Xdefaults       ~/.Xdefaults
    .emacs.d         ~/.emacs.d
    .gemrc           ~/.gemrc
    .gitconfig       ~/.gitconfig
    .irbrc           ~/.irbrc
    .psqlrc          ~/.psqlrc
    .pythonrc.py     ~/.pythonrc.py
    .screenrc        ~/.screenrc
    .ssh/config      ~/.ssh/config
    .tmux.conf       ~/.tmux.conf
    .xmonad          ~/.xmonad
    bin/areac        ~/bin/areac
    bin/clip2browser ~/bin/clip2browser
    bin/clip2google  ~/bin/clip2google
    bin/vim_pager.sh ~/bin/vim_pager.sh
    mybash.sh        ~/mybash.sh
  }].each do |source,dest|
    check_symlink(File.join(Dir.pwd, source), File.expand_path(dest))
  end
end
