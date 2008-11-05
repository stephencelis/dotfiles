set :stage, nil unless defined? stage

namespace :campfire do
  task :notify do
    return if defined? no_campfire && no_campfire # set :no_campfire, true
    begin
      require 'tinder'
      require 'cgi'
      campfire = Tinder::Campfire.new(campfire_subdomain, :ssl => true)
      campfire.login(campfire_login, campfire_password)
      campfire_rooms = Array(campfire_room) if defined? campfire_room
      campfire_rooms.each do |name|
        # This is better than Campfire#find_room_by_name
        room = campfire.rooms.find { |r| CGI.unescapeHTML(r.name) =~ /#{name}/i }
        room.speak "#{ENV['USER']} deployed #{application} #{stage}"
      end
    rescue LoadError
      puts "Campfire deploy notices require tinder: gem install tinder"
    rescue NameError
      puts "Campfire deploy notices require the following variables to be set:",
        "campfire_subdomain, campfire_login, campfire_password, campfire_rooms"
    end
  end
end

after "deploy", "campfire:notify"
