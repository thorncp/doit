module Doit
  class CLI
    def initialize(datastore, argv, out = $stdout)
      @datastore = datastore
      @argv = argv
      @out = out
    end

    def execute
      case @argv.shift
      when "add", "a", "new"
        add_task @argv.join(" ")
      when "delete", "del", "rm", "remove"
        del_task @argv.shift.to_i
      else
        print_tasks
      end
    end

    def add_task(task)
      @datastore << task
      @out.puts "Added: " + task
    end

    def del_task(index)
      task = @datastore.delete_at(index)
      @out.puts "Deleted: #{task}"
    end

    def print_tasks
      @datastore.each_with_index do |task, index|
        @out.puts "#{index}: #{task}"
      end
    end
  end
end
