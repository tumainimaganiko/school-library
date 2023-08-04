class SaveData
  def file_reader(arg)
    file_content = JSON.parse(File.read(arg))
    file_content if file_content.is_a?(Array)
  rescue StandardError
    []
  end

end
