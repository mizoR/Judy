require 'spec_helper'

describe command('ruby -v'), sudo: false do
  its(:stdout) { should match %r|ruby 2.3.\d| }
end

describe command('bundle -v'), sudo: false do
  its(:stdout) { should match %r|Bundler version 1.12.\d| }
end
