
class GroceryModel {
	final String name, urlImage, desc, id, idCart;
	final int weightGram, price;

	GroceryModel({
		this.id,
		this.idCart,
		this.name,
		this.urlImage,
		this.desc,
		this.weightGram,
		this.price
	});
}

final List<GroceryModel> listGrocery = [
	GroceryModel(
		id: "G0001",
		idCart: "C0001",
		name : "Mie Sedaap Tasty",
		urlImage: "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//83/MTA-4202533/mie_sedap_mie_instant_sedap_129gr_tasty_bakmi_ayam_full02.jpg",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 58,
		price : 50000
	),
	GroceryModel(
		id: "G0002",
		idCart: "C0002",
		name : "Kecap Bangau",
		urlImage: "https://ecs7.tokopedia.net/img/cache/700/product-1/2017/9/24/2833458/2833458_42f10bdf-f19e-48b0-a920-c37322f960fe_300_300.jpg",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 58,
		price : 10000
	),
	GroceryModel(
		id: "G0003",
		idCart: "C0003",
		name : "Beras 5kg",
		urlImage: "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//96/MTA-3832079/fortune_beras-fortune-10kg-sak-premium_full02.jpg",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 5000,
		price : 65000
	),
	GroceryModel(
		id: "G0004",
		idCart: "C0004",
		name : "Minyak Goreng Bimoli",
		urlImage: "https://cdn.kmall.id/media/catalog/product/cache/c687aa7517cf01e65c009f6943c2b1e9/b/i/bimoli_bimoli-spc-minyak-goreng--pouch-1-l-_full02.jpg",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 1000,
		price : 12000
	),
	GroceryModel(
		id: "G0005",
		idCart: "C0005",
		name : "Royco Jamur",
		urlImage: "https://cf.shopee.co.id/file/f402a16b7db7c281598e100a470a6039_tn",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 70,
		price : 2000
	),
	GroceryModel(
		id: "G0006",
		idCart: "C0006",
		name : "Tepung Terigu",
		urlImage: "https://ecs7.tokopedia.net/img/cache/700/product-1/2020/6/8/4449614/4449614_5999a902-c997-48ef-9ebb-91f3f5ebc1b9_700_700",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 1000,
		price : 15000
	),


	GroceryModel(
		id: "G0007",
		idCart: "C0007",
		name : "Mie Sedaap Tasty",
		urlImage: "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//83/MTA-4202533/mie_sedap_mie_instant_sedap_129gr_tasty_bakmi_ayam_full02.jpg",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 58,
		price : 50000
	),
	GroceryModel(
		id: "G0008",
		idCart: "C0008",
		name : "Kecap Bangau",
		urlImage: "https://ecs7.tokopedia.net/img/cache/700/product-1/2017/9/24/2833458/2833458_42f10bdf-f19e-48b0-a920-c37322f960fe_300_300.jpg",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 58,
		price : 10000
	),
	GroceryModel(
		id: "G0009",
		idCart: "C0009",
		name : "Beras 5kg",
		urlImage: "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//96/MTA-3832079/fortune_beras-fortune-10kg-sak-premium_full02.jpg",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 5000,
		price : 65000
	),
	GroceryModel(
		id: "G00010",
		idCart: "C00010",
		name : "Minyak Goreng Bimoli",
		urlImage: "https://cdn.kmall.id/media/catalog/product/cache/c687aa7517cf01e65c009f6943c2b1e9/b/i/bimoli_bimoli-spc-minyak-goreng--pouch-1-l-_full02.jpg",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 1000,
		price : 12000
	),
	GroceryModel(
		id: "G00011",
		idCart: "C00011",
		name : "Royco Jamur",
		urlImage: "https://cf.shopee.co.id/file/f402a16b7db7c281598e100a470a6039_tn",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 70,
		price : 2000
	),
	GroceryModel(
		id: "G00012",
		idCart: "C00012",
		name : "Tepung Terigu",
		urlImage: "https://ecs7.tokopedia.net/img/cache/700/product-1/2020/6/8/4449614/4449614_5999a902-c997-48ef-9ebb-91f3f5ebc1b9_700_700",
		desc : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu tellus non diam condimentum sollicitudin. Praesent tincidunt placerat dignissim. Nam non rutrum dui. Nullam sed neque at nunc congue dapibus. Phasellus sagittis sit amet ligula nec scelerisque. Pellentesque a sagittis arcu, nec feugiat sem.",
		weightGram : 1000,
		price : 15000
	),
];
