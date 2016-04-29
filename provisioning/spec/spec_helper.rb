ENV['STAGE'] ||= 'development'

require 'serverspec'
require 'net/ssh'
require 'tempfile'
require File.join('./', 'spec', 'helper', 'stages', ENV['STAGE'])

set :backend, :ssh
