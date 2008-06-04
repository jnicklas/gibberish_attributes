$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

Gibberish = Module.new

require 'gibberish_attributes'
require 'rubygems'
require 'spec'
