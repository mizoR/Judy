host = 'bot001'
config = Tempfile.new('', Dir.tmpdir)
config.write(`vagrant ssh-config #{host}`)
config.close

set :ssh_options, Net::SSH::Config.for(host, [config.path])
