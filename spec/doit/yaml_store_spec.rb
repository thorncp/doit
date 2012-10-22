require_relative "../../lib/doit/yaml_store"
require 'tempfile'

module Doit
  describe YAMLStore do
    let(:path) { Tempfile.new("doit-spec-yaml-store").path }
    subject { YAMLStore.new path }

    it "should add a task" do
      subject << "take out trash"
      subject.should include "take out trash"
    end

    it "should list tasks" do
      subject << "take out trash"
      subject << "do laundry"
      subject.tasks.should == ["take out trash", "do laundry"]
    end

    it "should delete tasks" do
      subject << "take out trash"
      subject << "do laundry"
      subject.delete_at(0)
      subject.tasks.should == ["do laundry"]
    end
  end
end
