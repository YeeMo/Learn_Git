#! /Users/reedfeng/.rvm/rubies/ruby-2.3.4/bin/ruby

p ARGV
name = ARGV[0].split('/').last.split['.'].first
first_path = File.expand_path(ARGV[0], Dir.pwd)
sec_path = File.expand_path(ARGV[1], Dir.pwd)

result_path = File.expand_path("#{name}_result.json", Dir.pwd)

first_urns = []
File.open(first_path) do |f|
  f.each_line do |line|
    first_urns << line
  end
end

sec_urns = []
File.open(sec_path) do |f|
  f.each_line do |line|
    sec_urns << line
  end
end

common = []
first_urns.each do |urn|
  common << urn if sec_urns.include? urn
end

File.open(result_path, 'w') do |f|
  common.uniq.each do |urn|
    f.write("#{urn}\n")
  end
end
