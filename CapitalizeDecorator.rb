require "./decorator.rb"

class CapitalizeDecorator < Decorator
  def correct_name
    @component.correct_name.capitalize
  end
end
