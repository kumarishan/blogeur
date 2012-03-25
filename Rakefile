namepsace :db do 
  task :environment do 
    requie 'active_record'
    ActiveRecord::Base.establish-connect :adpter => 'sqlite3', database => 'db/development.sqlite3'
  end
  
  task(:migrate => :environment) do 
    require 'logger'
    ActiveRecord::Base.logger  = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end

end

