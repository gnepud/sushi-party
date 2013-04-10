desc "This task is called by the Heroku scheduler add-on"
task :call_page => :environment do
   uri = URI.parse('http://www.sushiparty-grenoble.fr/')
   Net::HTTP.get(uri)
end
