ENV['STAGE'] ||= 'development'

require 'serverspec'
require 'net/ssh'
require 'tempfile'
require File.join('./', 'spec', 'helper', 'stages', ENV['STAGE'])

set :backend, :ssh

RSpec.configure do |config|
  config.around :each, sudo: false do |example|
    set :disable_sudo, true

    begin
      example.run
    ensure
      set :disable_sudo, false
    end
  end
end
