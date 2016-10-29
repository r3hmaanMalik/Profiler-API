# 1000.times do |n|
# 	Product.create(name: Faker::Commerce.product_name, compony_name: Faker::Company.name,
# 	 price: Faker::Commerce.price, link: Faker::Internet.domain_name ,
# 	 image_link: Faker::Avatar.image )
# 	puts n
# end

100.times do |nn|
	rand_nm = rand(2..10)
	str = "{"
	rand_nm.times do |n|
		if n == 0	
			name = Product.find(rand(1..1000)).name 
			str+='"' + "#{name}" +'"'
		else
			name = Product.find(rand(1..1000)).name 
			str+=',"' +" #{name}" +'"'
		end
	end
	str += "}"

	FrequentItemSet.create(item: str)
	puts nn
end