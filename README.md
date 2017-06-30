# Acpi

This is just a wrapper around `acpi_listen`. So its not needed to use the /etc/acpi/...  

## Installation

Add this line to your application's Gemfile:

```
$ gem install acpi
```

## Usage

```
racpi sample.rb

Loading sample.rb
Registerd 3 events ...
Waiting for events ...
"video/brightnessup BRTUP 00000086 00000000"
Brightness increased.
"video/brightnessup BRTUP 00000086 00000000"
Brightness increased.
"video/brightnessdown BRTDN 00000087 00000000"
Brightness decreased.
"video/brightnessdown BRTDN 00000087 00000000"
Brightness decreased.
```

Sample config:

```
on // do |event|
  p event
end

on /BRTUP/ do
  puts "Brightness increased."
end

on /BRTDN/ do
  puts "Brightness decreased."
end
```
