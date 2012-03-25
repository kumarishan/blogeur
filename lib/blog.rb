require 'posterous'
require 'cache'

Posterous.config = {
  'username' => 'your email address',
  'password' => 'your password',
  'api_token' => 'your token'
}

class Blog
  include Posterous
  @@cache = Cache.new
  
  def self.getUser
    puts 'called getUser'
    if @@cache.exist? 'user'
      puts 'cache hit for user'
      return @@cache.get 'user'
    else
      user = User.me
      @@cache.set 'user', user, 5.minutes
      puts @@cache.exist? 'user'
      return user
    end
    
  end

  def self.getSpaces
    puts 'called getSpaces'
    if @@cache.exist? 'spaces'
      puts 'cache hit for spaces'
      return @@cache.get 'spaces'
    else
      spaces = Site.all
      @@cache.set 'spaces', spaces, 5.minutes
      return spaces
    end
  end

  def self.getSpace(space_id)
    puts 'called getSpace' 
    if @@cache.exist? 'spaces'
      puts 'cache hit for spaces'
      spaces = @@cache.get 'spaces'
      spaces.each do |space|
        if space.hostname == space_id
          return space
        end
      end
    else
      return Site.find(space_id)
    end

  end

end
