Order.transaction do
	(1..100).each do |i|
		Order.create(bill_to_first_name: "Customer #{i}", bill_to_last_name: 
			"Customer #{i}", bill_to_address: "#{i} Main Street",
			bill_to_city: "City #{i}", bill_to_state: "State #{i}",
			bill_to_postal_code: "123456", ship_to_first_name: "Customer #{i}",
			ship_to_last_name: "Customer #{i}", ship_to_city: "City #{i}",
			ship_to_state: "State #{i}", ship_to_postal_code: "123456", 
			shipping: "free", price: "$59.00",
			email: "customer-#{i}@example.com", phone_number: "123-456-7890"
			)
	end
end