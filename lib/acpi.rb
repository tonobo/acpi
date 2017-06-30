require "acpi/version"
require 'acpi/dsl'
require 'acpi/event'

module Acpi
  module_function

  def setup?
    return if path
    die("acpi_listen binary is missing. Aborting.")
  end

  def listen
    setup?    
    IO.popen("#{path}/acpi_listen", :err=>[:child, :out]) do |io|
      io.each do |x|
        Acpi::Event.events.each do |event|
          event.call(x.chomp)
        end
      end
    end
  end

  def die(msg)
    STDERR.puts(msg)
    exit(1)
  end
  
  def path
    ENV['PATH'].split(':').find{|x| File.executable?("#{x}/acpi_listen") } 
  end
end
