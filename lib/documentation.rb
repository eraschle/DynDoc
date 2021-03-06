# frozen_string_literal: true

require_relative 'documentation/version'
require_relative 'custom_node_manager'
require_relative 'helpers/file_helper'

module Documentation
  class Error < StandardError
  end
  # Your code goes here...

  # Main class for creating dynamo documentation
  class Dynamo
    def initialize
      @manager = CustomNodeManager.new
      @errors = {}
    end

    def import_file(file_path)
      @manager.create(file_path)
    # rescue StandardError => e
    #   @errors[file_path] = e.backtrace
    #   puts e.backtrace
    #   raise
    end

    def import_dir(dir_path, extension = 'dyf')
      data = []
      files = FileHelper.files_of(dir_path, extension)
      files.each do |file|
        data << import_file(file)
      end
      data
    end
  end
end
