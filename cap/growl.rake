set :stage, nil unless defined? stage

namespace :growl do
  task :notify do
    set :growl_message, ENV["GROWL_MESSAGE"] || "wants your attention"
    `growlnotify -ncap -m "#{growl_message}" Capistrano`
  end

  task :alert do
    set :growl_message, ENV["GROWL_MESSAGE"] || "needs your attention"
    `growlnotify -ncap -p2 -m "#{growl_message}" Capistrano`
  end
end

after "deploy" do
  ENV["GROWL_MESSAGE"] ||= "deployed #{application} #{stage}"
  find_and_execute_task "growl:notify"
end

after "rollback" do
  ENV["GROWL_MESSAGE"] ||= "rolled back #{application} #{stage}"
  find_and_execute_task "growl:alert"
end
