1000.times do |n|
	p_name = Faker::Commerce.product_name
	c_name = Faker::Company.name
	price =Faker::Commerce.price
	d_link = Faker::Internet.domain_name
	
	Product.create(name: p_name, compony_name: c_name,
		price: price, link: d_link ,
		image_link: Faker::Avatar.image )
		puts "product_name: #{p_name} "
		puts "compony_name: #{c_name}"
		puts "price: #{price}"
		puts "link: #{d_link}"
	end

100.times do |nn|
	rand_nm = rand(2..10)
	str = "{"
	rand_nm.times do |n|
		if n == 0	
			name = Product.find(rand(1..1000)).name 
			str+='"' + "#{name}" +'"'
		else
			name = Product.find(rand(1..1000)).name 
			str+=',"' +"#{name}" +'"'
		end
	end
	str += "}"

	FrequentItemSet.create(item: str)
	puts "#{nn}th Item set"
end