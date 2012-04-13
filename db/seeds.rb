Product.delete_all

Product.create(
	name: 'Moisturize+Shield',
	description:
	%{<p>A daily facial moisturizer with a dual purpose: to moisturize & shield. 
		Designed to help the skin feel nourished with its powerful antioxidants and 
		organic ingredients. Packed with UVA/UVB sun protection. Apply lightly to 
		face after washing. Use with Wash & Protect face wash for best results.</p>},
	image_url: 'moisturize+shield-white.jpg',
	price: 59.00,
	size_id: 1
)
Product.create(
	name: 'Wash+Protect',
	description:
	%{<p>This soothing daily facial cleanser is rich in antioxidants, vitamins 
		and essential oils. This cleansing formula removes pore-clogging oil, dirt 
		and impurities preventing breakouts and ingrown hairs. Use once or twice 
		daily. Follow with Moisturize & Shield for best results.</p>},
	image_url: 'wash+protect-white.jpg',
	price: 29.00,
	size_id: 2
)