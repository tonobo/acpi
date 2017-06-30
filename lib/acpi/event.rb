module Acpi
  class Event
    class << self
      def events
        @events ||= []
      end
    end

    attr_reader :condition, :callback

    def initialize(condition:, &block)
      @condition = condition
      @callback = block
    end

    def register
      return if self.class.events.include?(self)
      self.class.events << self
    end

    def call(event_string)
      return unless runnable?(event_string)
      callback.call(event_string)
    end

    private

    def runnable?(event_string)
      if condition.is_a?(Regexp) 
        return !event_string[condition].nil?
      end
      if condition.is_a?(Array)
        return condition.include?(event_string)
      end
      return event_string == condition
    end

  end
end
