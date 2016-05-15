root = File.expand_path(File.dirname(__FILE__))

Dir.glob(File.join(root, 'lib', 'ruboty', '**', '*.rb')).each do |file|
  require file
end
