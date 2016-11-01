class DummiesController < ApplicationController

  def index
    header_set = request.headers['api-key']
		session_key = request.headers['session-key']
    if website = AgentWebsite.find_by(website_api_key: header_set)
      if (!session_key.nil? && profile = Profiler.find_by(session_key: session_key))
          Profiler.expiry_check(profile , params[:product_name] , website) 
        if params[:product_name]
          @sets = FrequentItemSet.where('item like ?' , "%#{params[:product_name]}%")
          array_name = @sets[0].item.split(',')
          array_name = array_name.map {|a| a.gsub(/({|}|")/,'')}
          @arr = []
          array_name.each do |a|
            @arr << Product.find_by(name: a)
          end 
        end
      else
        Profiler.without_session(website , params[:product_name]) 
      end
    end
  end

 # if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
 #      redirect_to :back
 #    else
 #       render nothing: true
 #    end

 
end
