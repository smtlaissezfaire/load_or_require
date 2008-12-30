require File.dirname(__FILE__) + "/spec_helper"

describe Kernel do
  describe "load_or_require" do
    before(:each) do
      @conf = Rails::Configuration.new
      Rails.configuration = @conf
    end

    it "should call load when cache_classes = false" do
      @conf.cache_classes = false
      self.should_receive(:load).with("foo")
      load_or_require("foo")
    end

    it "should load the correct filename" do
      @conf.cache_classes = false
      self.should_receive(:load).with("bar")
      load_or_require("bar")
    end

    it "should call require when cache_classes = true" do
      @conf.cache_classes = true
      self.should_receive(:require).with("foo")
      load_or_require("foo")
    end

    it "should require the correct name" do
      @conf.cache_classes = true
      self.should_receive(:require).with("bar")
      load_or_require("bar")
    end
  end
end
