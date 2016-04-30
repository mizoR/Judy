require 'spec_helper'

describe command('ruby -v'), sudo: false do
  its(:stdout) { should match %r|ruby 2.3.0| }
end
