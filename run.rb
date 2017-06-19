#!/usr/bin/env ruby

#==============
# gem xcodeproj required.
#==============
require 'xcodeproj'

def get_xcode_default_user(project_path)
  Dir.chdir("#{project_path}/xcuserdata") do
    key =  Dir["*"].first
    return nil if key.nil?
    return File.basename(key, ".xcuserdatad")
  end
end

def ensure_shared_scheme(project_path)
  shared_path = Xcodeproj::XCScheme.shared_data_dir(project_path)
  return puts('shared data checked, Good job ...') unless Dir["#{shared_path}/*"].count.zero?

  puts 'Begin to analysis the user of this project'
  user = get_xcode_default_user(project_path)
  puts "user = #{user}"
  scheme_name = File.basename(project_path, '.xcodeproj')
  puts "Begin to share the scheme from #{scheme_name} of user #{user}"
  Xcodeproj::XCScheme.share_scheme(project_path, scheme_name, user)
  puts "scheme shared."
  return scheme_name
rescue
  puts "fail to build scheme, please share the scheme file manually."
end
ensure_shared_scheme(ARGV[0])
