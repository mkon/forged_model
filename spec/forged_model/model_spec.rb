require "spec_helper"

describe ForgedModel::Model do

  before { @Dummy = Class.new(ForgedModel::Model) }

  describe "self.define_attributes" do

    before { @Dummy.define_attributes :foo }

    it "creates the public methods" do
      dummy = @Dummy.new
      expect(dummy).to respond_to(:foo)
      expect(dummy).to respond_to(:foo=)
      dummy.foo = "value"
      expect(dummy.foo).to eq("value")
    end

    it "allows subclasses to inherit attributes" do
      SubDummy = Class.new(@Dummy)
      SubDummy.define_attributes :bar
      dummy = SubDummy.new
      expect(dummy).to respond_to(:foo)
      expect(dummy).to respond_to(:bar)
    end

  end

  describe "initialize" do

    it "correctly assigns the attributes" do
      @Dummy.define_attributes :foo
      dummy = @Dummy.new(foo: "bar")
      expect(dummy.foo).to eq("bar")
    end

    it "raises an error if an attribute does not exist" do
      expect {
        dummy = @Dummy.new(notexisting: "something")
      }.to raise_error(NoMethodError)
    end

  end

  describe "attributes" do

    before { @Dummy.define_attributes :foo, :bar }

    it "returns a hash of attribute key/value pairs" do
      dummy = @Dummy.new(foo: "value1", bar: "value2")
      expect(dummy.attributes).to eq(foo: "value1", bar: "value2")
    end

    it "only includes set attributes" do
      dummy = @Dummy.new(foo: "value1")
      expect(dummy.attributes).to_not include(:bar)
    end

  end

  describe "attribute tracking" do

    it "correctly keeps track of changes" do
      @Dummy.define_attributes :foo
      dummy = @Dummy.new(foo: "value1")
      expect(dummy.changed_attributes).to be_empty
      dummy.foo = "value2"
      expect(dummy.changed_attributes.key? "foo").to be_true
      expect(dummy.foo_was).to eq("value1")
    end

  end

end
