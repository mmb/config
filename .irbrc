%w{

rubygems

irb/completion
map_by_method
pp
what_methods

}.each { |x| require x }

IRB.conf[:AUTO_INDENT]=true
