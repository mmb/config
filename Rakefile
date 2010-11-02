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
  Hash[*%w{
    .emacs.d         ~/.emacs.d
    .gemrc           ~/.gemrc
    .gitconfig       ~/.gitconfig
    .irbrc           ~/.irbrc
    .screenrc        ~/.screenrc
    .xmonad          ~/.xmonad
    mybash.sh        ~/mybash.sh
    bin/vim_pager.sh ~/bin/vim_pager.sh
    bin/areac        ~/bin/areac
    bin/clip2browser ~/bin/clip2browser
    bin/clip2google  ~/bin/clip2google
    .Xdefaults       ~/.Xdefaults
  }].each do |source,dest|
    check_symlink(File.join(Dir.pwd, source), File.expand_path(dest))
  end
end
