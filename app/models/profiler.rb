class Profiler < ApplicationRecord
  belongs_to :agent_websites

  def self.expiry_check profile , product , website
  	if profile.expiry_time < Time.now
  		visit = profile.visited
  		visit += ",#{product}"
  		profile.update_attributes(visited: visit)
  	else
  		session_key =  Base64.encode64((0...10).map { ('a'..'z').to_a[rand(26)] }.join)	
			session_key = session_key[0..session_key.length-2]  
  		Profiler.create(agent_website_id: website.id , user_session_key: session_key ,
  		 expiry_time: Time.now + 30*60 , visited: product)
  	end
  end

  def self.without_session website , product
  	session_key =  Base64.encode64((0...10).map { ('a'..'z').to_a[rand(26)] }.join)	
		session_key = session_key[0..session_key.length-2]  
  	Profiler.create(agent_website_id: website.id , user_session_key: session_key ,
  		expiry_time: Time.now + 30*60 , visited: product)
  end
end
