module Acpi
  module DSL
    def on condition, &block
      Event.new(condition: condition, &block).register
    end
  end
end
