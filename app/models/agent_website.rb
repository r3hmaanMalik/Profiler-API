# == Schema Information
#
# Table name: agent_websites
#
#  id              :integer          not null, primary key
#  website_link    :string(255)
#  website_api_key :string(255)
#  agent_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class AgentWebsite < ApplicationRecord
  belongs_to :agent

  before_save do
		create_website_api_key(self)   	
  end

  def create_website_api_key(website)
  	website.website_api_key =  Base64.encode64((0...50).map { ('a'..'z').to_a[rand(26)] }.join)	
  end

  def self.create_website_api_key2(website)
  	website.website_api_key =  Base64.encode64((0...50).map { ('a'..'z').to_a[rand(26)] }.join)	
  	website.save!
  end

end
