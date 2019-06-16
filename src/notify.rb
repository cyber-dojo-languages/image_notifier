
# Main entry point for cyberdojofoundation/image_notifier docker image.

def assert_backtick(command)
  output = `#{command}`
  status = $?.exitstatus
  unless status == success
    failed command, "exit_status == #{status}", output
  end
  output
end

def success
  0
end

def failed(*lines)
  (['FAILED'] + lines.flatten).each do |line|
    STDERR.puts(line)
  end
  exit 1
end

# ------------------------------------------

repos = ARGV
puts "number of dependent repos: #{repos.size}"
repos.each do |repo_name|
  puts "  cyber-dojo-languages/#{repo_name}"
  output = assert_backtick "#{__dir__}/post_trigger-circleci.sh #{repo_name}"
  puts output
  puts '- - - - - - - - -'
end
