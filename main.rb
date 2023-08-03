require_relative 'app'

def main
  app = App.new
  app.load_data_from_json
  app.main_loop
end

main
