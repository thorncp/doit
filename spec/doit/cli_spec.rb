require_relative "../../lib/doit/cli"
require "shellwords"
require "stringio"

module Doit
  describe CLI do
    it "should add an item" do
      argv = Shellwords.split("add take out trash")
      out = StringIO.new
      cli = CLI.new [], argv, out
      cli.execute
      out.string.should == "Added: take out trash\n"
    end

    it "should show items" do
      datastore = []
      argv = Shellwords.split("add take out trash")
      cli = CLI.new datastore, argv, stub.as_null_object
      cli.execute

      out = StringIO.new
      cli = CLI.new datastore, [], out
      cli.execute
      out.string.should == "0: take out trash\n"
    end

    it "should delete items" do
      datastore = []
      argv = Shellwords.split("add take out trash")
      cli = CLI.new datastore, argv, stub.as_null_object
      cli.execute

      out = StringIO.new
      argv = Shellwords.split("del 0")
      cli = CLI.new datastore, argv, out
      cli.execute
      out.string.should == "Deleted: take out trash\n"

      out = StringIO.new
      cli = CLI.new datastore, [], out
      cli.execute
      out.string.should == ""
    end
  end
end
