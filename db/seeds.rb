require 'nokogiri'
require 'open-uri'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Clean base ..."

Pin.destroy_all
Region.destroy_all
Categorie.destroy_all
Post.destroy_all


puts "Create regions ..."

hokkaido = Region.create(name: "Hokkaido", description: "Hokkaido is the northernmost of Japan’s main islands, known for its volcanoes, natural hot springs (onsen) and ski areas. Rugged Daisetsuzan National Park is home to steaming, volcanic Mount Asahi. Shikotsu-Tōya National Park contains caldera lakes, geothermal springs and a Mount Fuji look-alike, Mount Yōtei. Popular ski resorts include Rusutsu, Furano and Niseko.")
tohoku = Region.create(name: "Tohoku", description: "Tohoku is a region of Japan’s Honshu Island, home to scenic lakes, forests, mountains and temples. In the remote Dewa Sanzan mountains, the Three Sacred Mountains of Dewa are pilgrimage sites with ancient Shinto shrines. The city of Sendai is known for its castle and the Osaki Hachimangu Shinto shrine. The town of Yamagata is home to the Yamadera temple complex, with its hilltop pagoda.")
kanto = Region.create(name: "Kanto", description: "Kanto is a region on the Japanese island of Honshu that includes the Greater Tokyo Area and its prefectures. In Tokyo, the capital, skyscrapers, shopping and pop culture meet traditional temples, shrines and cherry blossoms. Mount Fuji, a symmetrical volcano, lies southwest of Tokyo, and Hakone has hot springs and a scenic mountain lake. Izu Peninsula is known for beaches, diving and onsen resorts.")
chubu = Region.create(name: "Chubu", description: "Chubu is a region in central Japan, home to the country’s iconic Mount Fuji. The mountain’s climbing routes include the Yoshida Trail, which starts at the Fuji Subaru Line 5th Station. The Fuji Five Lakes area encompasses lakes and hot springs. In the Nagano prefecture, the city of Matsumoto is known for Matsumoto Castle, a 16th-century stronghold nicknamed “Crow Castle” for its black exterior.")
kansai = Region.create(name: "Kansai", description: "Kansai is a region on the Japanese island of Honshu. In its capital, Kyoto, the sprawling Nijo Castle was built in 1603, and the ornate gold pavilion of Kinkakuji dates to 1397. Kyoto is also home to the serene, centuries-old Zen gardens of Ryoanji temple and the ancient Buddhist complex of Nanzenji temple. Nearby is the city of Nara, Japan’s 8th-century capital, with the famous Todaiji temple.")
chugoku = Region.create(name: "Chugoku", description: "Chugoku is a region on the Inland Sea coast of western Honshu, Japan’s main island. It’s known for cities like Hiroshima, a modern metropolis on the site of the atomic bomb attack in 1945. The city of Okayama is home to the Korakuen Garden, with its traditional landscaping and teahouses. The region’s islands include the mountainous, pine-covered Shodo Island and the sandy beaches of Miyajima.")
shikoku = Region.create(name: "Shikoku", description: "Shikoku is the smallest of Japan’s four main islands. It’s rural, mountainous and heavily forested, with a craggy, 1,982m peak, Mount Ishizuchi, at its heart. Just off Shikoku’s eastern coast, Naruto Strait is famous for whirlpools. The prefecture of Ehime is home to the city of Matsuyama, with its hilltop Matsuyama Castle and Dogo Onsen, one of Japan’s oldest hot-spring resorts.")
kyushu = Region.create(name: "Kyushu", description: "Kyushu, the southwesternmost of Japan’s main islands, has a mostly subtropical climate. It’s known for its active volcanoes, beaches and natural hot springs such as those at Beppu. Its city of Fukuoka is home to museums, mega-malls and Kushida-jinja, an 8th-century Shinto shrine. The city of Nagasaki's 1945 devastation by an atomic bomb is commemorated at the Nagasaki Peace Park and Atomic Bomb Museum.")
okinawa = Region.create(name: "Okinawa", description: "Okinawa is a Japanese prefecture comprising more than 150 islands in the East China Sea between Taiwan and Japan's mainland. It's known for its tropical climate, broad beaches and coral reefs, as well as World War II sites. On the largest island (also named Okinawa) is Okinawa Prefectural Peace Memorial Museum, commemorating a massive 1945 Allied invasion, and Churaumi Aquarium, home to whale sharks and manta rays.")

puts "Create categories ..."

food = Categorie.create(name: "Food", description: "Japanese cuisine (和食, washoku) offers an abundance of gastronomical delights with a boundless variety of regional and seasonal dishes. Restaurants in Japan range from mobile food stands to centuries old ryotei, atmospheric drinking places, seasonally erected terraces over rivers, cheap chain shops and unique theme restaurants about ninja and robots. Many restaurants are specialized in a single type of dish, while others offer a variety of dishes.")
pop_culture = Categorie.create(name: "Pop-Culture", description: "Modern day manga (漫画) can be defined as comics corresponding to a Japanese style, which originated during the mid-1900s. The popularity of manga in Japan has since ballooned. Today, there is a huge domestic industry for manga, and increasingly so internationally. In Japan, people of both genders and all ages read manga.")
tradition = Categorie.create(name: "Tradition", description: "Japanese culture is rich and diverse, dating back to 10,000BC when the Jomon people first settled in Japan. It is widely known for its traditional arts as well as its contemporary pop culture. Today, Japan is a constitutional monarchy, and is home to a population of 127 million people.")
craftmanship = Categorie.create(name: "Craftmanship", description: "Japanese craftsmanship is an age-old tradition that has been passed down from generation to generation. It is a tradition that has been perfected over the years, and is still being perfected today. Japanese craftsmanship is a tradition that has been passed down from generation to generation. It is a tradition that has been perfected over the years, and is still being perfected today.")
nature = Categorie.create(name: "Nature", description: "Japan is a country of islands, so the sea is never far away. The country's coastline stretches for more than 18,000 miles, and there are thousands of beaches, both on the mainland and on the many islands. Japan is also home to many mountains, some of which are volcanoes. The country is also home to many rivers and lakes.")

puts "Create posts ..."

sushi = Post.create!(content: "Sushi (寿司 or 鮨) is the most famous Japanese dish outside of Japan, and one of the most popular dishes among the Japanese. In Japan, sushi is usually enjoyed on special occasions, such as a celebration.", multimedia: "/assets/images/sushi.jpg")
manga = Post.create(content: "Manga (漫画) are comics created in Japan, or by Japanese creators in the Japanese language, conforming to a style developed in Japan in the late 19th century. They have a long and complex pre-history in earlier Japanese art.", multimedia: "/assets/images/manga.jpg")
kinkakuji = Post.create(content: "Kinkaku-ji (金閣寺, literally \"Temple of the Golden Pavilion\"), officially named Rokuon-ji (鹿苑寺, literally \"Deer Garden Temple\"), is a Zen Buddhist temple in Kyoto, Japan. It is one of the most popular buildings in Japan, attracting a large number of visitors annually. It is designated as a National Special Historic Site, a National Special Landscape and is one of 17 locations making up the Historic Monuments of Ancient Kyoto which are World Heritage Sites.", multimedia: "/assets/images/kinkakuji.jpg")
katana = Post.create(content: "The katana (刀 or かたな) is a type of Japanese sword (日本刀, nihontō), also commonly referred to as a \"samurai sword\". The term katana may be applied to the standard size moderately curved Japanese sword with a blade length of greater than 60 cm (23.6 inches).", multimedia: "/assets/images/katana.jpg")
kenrokuen = Post.create(content: "Kenroku-en (兼六園, Six Attributes Garden), located in Kanazawa, Ishikawa, Japan, is an old private garden. Along with Kairaku-en and Koraku-en, Kenroku-en is one of the Three Great Gardens of Japan. The garden is open year-round and charges an admission fee.", multimedia: "/assets/images/kenrokuen.jpg")

puts "Create pins ..."

sushi_pin = Pin.create!(name: "Sushi", description: "Sushi (寿司 or 鮨) is the most famous Japanese dish outside of Japan, and one of the most popular dishes among the Japanese.", latitude: 35.6897, longitude: 139.6922, categorie: food, region: kanto, post: sushi)
manga_pin = Pin.create!(name: "Manga", description: "Manga (漫画) are comics created in Japan, or by Japanese creators in the Japanese language, conforming to a style developed in Japan in the late 19th century.", latitude: 32.750286, longitude: 129.877670, categorie: pop_culture, region: kyushu, post: manga)
kinkakuji_pin = Pin.create!(name: "Kinkaku-ji", description: "Kinkaku-ji (金閣寺, literally \"Temple of the Golden Pavilion\"), officially named Rokuon-ji (鹿苑寺, literally \"Deer Garden Temple\"), is a Zen Buddhist temple in Kyoto, Japan.", latitude: 35.0394, longitude: 135.7294, categorie: tradition, region: kansai, post: kinkakuji)
katana_pin = Pin.create!(name: "Katana", description: "The katana (刀 or かたな) is a type of Japanese sword (日本刀, nihontō), also commonly referred to as a \"samurai sword\".", latitude: 43.061936, longitude: 141.3542924, categorie: craftmanship, region: hokkaido, post: katana)
kenrokuen_pin = Pin.create!(name: "Kenroku-en", description: "Kenroku-en (兼六園, Six Attributes Garden), located in Kanazawa, Ishikawa, Japan, is an old private garden.", latitude: 36.5613, longitude: 136.6562, categorie: nature, region: chubu, post: kenrokuen)
