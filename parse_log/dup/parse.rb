p ARGV
names = ARGV[0].split('.')
log_path = File.expand_path(ARGV[0], Dir.pwd)

names[0] = names[0] + '_result'
result_path = File.expand_path(names.join('.'), Dir.pwd)

urns = []
File.open(log_path) do |f|
  f.each_line do |line|
    %r{already exist under urn:adsk.wipqa:fs.folder:co\.(?<urn>.*?)\"} =~ line
    urns << urn unless urn.nil?
  end
end

File.open(result_path, 'w') do |f|
  urns.uniq.each do |urn|
    f.write("#{urn}\n")
  end
end
