class JsonGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  argument :json_file, type: :string
  attr_reader :json_config, :model_name, :model_name_plural, :model_name_underscore

  def read_file
    data = File.read(json_file)
    @json_config = JSON.parse(data)
    @model_name = @json_config["model_name"]
    @model_name_underscore = @model_name.underscore
    @model_name_plural = @model_name_underscore.pluralize
    @command = @json_config['command']
  end

  def create_generator
    generate "#{@command} User title:string"
    # hook_for :test_framework, in: :rails, as: :controller
  end

end
