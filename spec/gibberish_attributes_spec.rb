require File.dirname(__FILE__) + '/spec_helper'

describe GibberishAttributes, '.translate' do
  
  before do
    @class = Class.new
    @class.send(:include, GibberishAttributes)
    @instance = @class.new
  end
  
  it "should create a reader, which accesses the default language (en)" do
    Gibberish.should_receive(:current_language).and_return(:en)
    @class.translate :title
    @instance.should_receive(:title_en).and_return('monkey')

    @instance.title.should == 'monkey'
  end
  
  it "should create a writer, which accesses the default language (en)" do
    Gibberish.should_receive(:current_language).and_return(:en)
    @class.translate :title
    @instance.should_receive(:title_en=).with('monkey')

    @instance.title = 'monkey'
  end
  
  it "should create a reader, which accesses another language (de)" do
    Gibberish.should_receive(:current_language).and_return(:de)
    @class.translate :title
    @instance.should_receive(:title_de).and_return('affe')

    @instance.title.should == 'affe'
  end
  
  it "should create a writer, which accesses another language (de)" do
    Gibberish.should_receive(:current_language).and_return(:de)
    @class.translate :title
    @instance.should_receive(:title_de=).with('affe')

    @instance.title = 'affe'
  end
  
  it "should create multiple writers for multiple attributes" do
    Gibberish.should_receive(:current_language).twice.and_return(:sv)
    @class.translate :title, :description
    @instance.should_receive(:title_sv).and_return('apa')
    @instance.should_receive(:description_sv).and_return('ett djur som liknar människan')

    @instance.title.should == 'apa'
    @instance.description.should == 'ett djur som liknar människan'
  end
  
  it "should create multiple writers for multiple attributes" do
    Gibberish.should_receive(:current_language).twice.and_return(:sv)
    @class.translate :title, :description
    @instance.should_receive(:title_sv=).with('apa')
    @instance.should_receive(:description_sv=).with('våra närmaste släktingar')

    @instance.title = 'apa'
    @instance.description = 'våra närmaste släktingar'
  end
  
end