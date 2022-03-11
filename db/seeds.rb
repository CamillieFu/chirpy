# puts "Deleting users ..."
# User.destroy_all
# puts "Done."
# puts "Creating users ..."
# mom = User.create(email: "mom@gmail.com", password: 1234567, first_name: "Caroline", last_name: "Benly")
# dad = User.create(email: "dad@gmail.com", password: 1234567, first_name: "Yann", last_name: "Benly")
# puts "Done."
# puts "Creating kids ..."
# luke = Kid.new(
#   first_name: "Yann",
#   last_name: "Benly",
#   age: 12,
#   birthday: "Wed, Jan 13 2010",
#   user: mom
# )
# brenna = Kid.new(
#   first_name: "Brenna",
#   last_name: "Benly",
#   age: 13,
#   birthday: "Thur, Feb 13 2009",
#   user: dad
# )
# luke.dictionary = Dictionary.new
# brenna.dictionary = Dictionary.new
# luke.save
# brenna.save
# puts "done"

# puts "destroying articles ..."
# Article.destroy_all
# puts "done"

# # method to get all the urls on the page
# puts "fetching urls"
# def fetch_articles_url(url)
#   global_news_url = url
#   html_content = URI.open(global_news_url, 'Accept-Language' => 'en').read
#   doc = Nokogiri::HTML(html_content)
#   archive = doc.search('#archive-latestStories').search('li')
#   links_without_ads = archive.reject do |a|
#     a.attribute('class').value.include?('c-posts__ad')
#   end
#   links_without_ads.map do |a|
#     a.search('a').attribute('href').value
#   end
# end
# puts "all fetched"

# puts "creating articles"
# # method to scrape the info on each individual url
# def scrape_article(url)
#   html_content = URI.open(url, 'Accept-Language' => 'en-US').read
#   doc = Nokogiri::HTML(html_content)
#   title = doc.search('h1').search('.l-article__title').text
#   author = doc.search('.c-byline__name').text.strip
#   date = doc.search('.c-byline__date.c-byline__date--pubDate').search('span').text
#   content = doc.search('.l-article__story.l-main__story').search('p')
#   {
#     title: title,
#     date: date,
#     author: author.strip,
#     content: content
#   }
# end

# first_urls = fetch_articles_url("https://globalnews.ca/tag/childrens-mental-health/")
# second_urls = fetch_articles_url("https://globalnews.ca/tag/teen-mental-health/")
# # scrape the urls and save them as new article instances
# puts "there are #{first_urls.count} article urls."
# count = 0
# first_urls.each do |url|
#   article = scrape_article(url)
#   Article.create(article)
#   puts "done making article #{count + 1}"
#   count += 1
# end
# puts "first articles completed"

# puts "there are #{second_urls.count} article urls."
# count = 0
# second_urls.each do |url|
#   article = scrape_article(url)
#   Article.create(article)
#   puts "done making article #{count + 1}"
#   count += 1
# end
# puts "second articles completed"

# puts "adding Qanon article"
# Article.create(
#   title: 'Why Teens Are Falling for Conspiracy Theories',
#   date: 'SEP 19, 2020',
#   author: 'Sofia Barnett',
#   content: "OF ALL THE bits of sleepover gossip ever uttered, this was the most unexpected. 'Basically, Hillary Clinton sex traffics children and sacrifices them to Satan or something,' said my friend Beth, straightfaced. 'It is called Pizzagate, or whatever.' It was a Friday night a few weeks ago and even though it was a typical girls night in, it was not a typical conversation—but I took the bait. 'It’s called Pizza what?' I asked, totally unsure of what I was getting myself into. 'Dude, you haven’t heard? Hillary and that one guy, John something? Podesta? They are involved in this massive underground sex trafficking operation. I saw it on TikTok. It is everywhere.' Half convinced she was kidding, I asked if she actually believed something so obviously ridiculous. 'I swear, it is legit,' Beth replied. “There’s been like five videos talking about it in a row. It’s clearly not a coincidence.'\n
#   At the completion of Beth’s ode to Pizzagate, I stared at her, eyebrows raised, mouth open. Taking note of my expression, she rolled her eyes. Then I did too. But for the rest of the night, I watched my two best friends gush over the medley of conspiracy theories that had been flickering across their TikTok “For You” pages and Twitter feeds, listening to them debate which celebrity had exploited the most children and who had sacrificed who to what Hollywood god. As the conversation intensified, and the lack of actual evidence became more and more obvious, I was overwhelmed by a wave of hysteria. It all seemed so ridiculous. How could these seemingly well-educated teenagers—rising high school seniors, even—be gullible enough to take a 60-second social media video for the truth? Conspiracy theories always seemed so juvenile to me. I knew better. Others, it seemed, did not.\n
#   On the surface, it makes sense that young people would latch on to conspiracy theories on TikTok. The platform skews young—reportedly one-third of its daily users in the US are 14 or younger—and celebrity gossip has long been the lingua franca of social media for people of all ages. Right-wing conspiracy groups like QAnon have been spreading made-up stories about those in power on networks like Facebook for years. Now those ideas have jumped to TikTok, where they’re being metabolized by much younger consumers. Those things all scan. What doesn’t, however, is why teens believe them.\n
#   The short answer? TikTok is full of crazy ideas—conspiracies are no different. They've been normalized by the platform where many young people spend most of their time. “Many of these conspiracy sites and stories are entertaining. They are social gathering spots. They are exciting,” says Nancy Rosenblum, Senator Joseph S. Clark Professor of Ethics in Politics and Government at Harvard University and coauthor of A Lot of People Are Saying: The New Conspiracism and the Assault on Democracy. “It’s small wonder that teenagers who ‘live on the screen’ would be drawn to the drama.”\n
#   Easy access to social media’s redistribution tools worsens this problem. With every like, share, send, and retweet, teenagers are popularizing this content worldwide. “On social media, repetition substitutes for validation,” says Russel Muirhead, a professor of democracy and politics at Dartmouth College and Rosenblum’s coauthor. “Repetition is what breathes air into conspiracy theories, and social media is all about repetition. But repeating something that’s false does not make it more true! Teenagers are just as vulnerable to this as grown-ups.”
#   "
# )
# puts "done"

puts "making fake stats"
Statistic.destroy_all

4000.times do
  Statistic.create(
    tone: rand(0..7),
    kid: Kid.first,
    created_at: rand((DateTime.now - 1.months)..DateTime.now)
  )
end

puts "still making.... almost done"

3600.times do
  Statistic.create(
    tone: rand(4..7),
    kid: Kid.first,
    created_at: rand((DateTime.now - 1.months)..DateTime.now)
  )
end

700.times do
  Statistic.create(
    tone: rand(0..7),
    kid: Kid.first,
    created_at: rand((DateTime.now - 2.weeks)..DateTime.now)
  )
end

puts "done with stats"
