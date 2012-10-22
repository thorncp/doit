require "yaml/store"

module Doit
  class YAMLStore
    def initialize(path)
      @store = YAML::Store.new path
    end

    include Enumerable

    def each(&block)
      tasks.each(&block)
    end

    def <<(task)
      @store.transaction do
        @store["tasks"] ||= []
        @store["tasks"] << task
      end
    end

    def delete_at(index)
      @store.transaction do
        @store["tasks"].delete_at(index)
      end
    end

    def tasks
      @store.transaction(true) {
        @store.fetch("tasks", [])
      }
    end
  end
end
