
puts "Deleting users ..."
User.destroy_all
puts "Done."
puts "Creating users ..."
mom = User.create(email: "mom@gmail.com", password: 1234567, first_name: "Caroline", last_name: "Benly")
dad = User.create(email: "dad@gmail.com", password: 1234567, first_name: "Yann", last_name: "Benly")
puts "Done."
puts "Creating kids ..."
luke = Kid.new(
  first_name: "Yann",
  last_name: "Benly",
  age: 12,
  birthday: "Wed, Jan 13 2010",
  user: mom
)
brenna = Kid.new(
  first_name: "Brenna",
  last_name: "Benly",
  age: 13,
  birthday: "Thur, Feb 13 2009",
  user: dad
)
luke.dictionary = Dictionary.new
brenna.dictionary = Dictionary.new
luke.save
brenna.save
puts "done"

puts "destroying articles ..."
Article.destroy_all
puts "done"
puts "creating articles"

# method to get all the urls on the page
def fetch_articles_url(url)
  global_news_url = url
  html_content = URI.open(global_news_url, 'Accept-Language' => 'en').read
  doc = Nokogiri::HTML(html_content)
  archive = doc.search('#archive-latestStories').search('li')
  links_without_ads = archive.reject do |a|
    a.attribute('class').value.include?('c-posts__ad')
  end
  links_without_ads.map do |a|
    a.search('a').attribute('href').value
  end
end

# method to scrape the info on each individual url
def scrape_article(url)
  html_content = URI.open(url, 'Accept-Language' => 'en-US').read
  doc = Nokogiri::HTML(html_content)
  title = doc.search('h1').search('.l-article__title').text
  author = doc.search('.c-byline__name').text.strip
  date = doc.search('.c-byline__date.c-byline__date--pubDate').search('span').text
  content = doc.search('.l-article__story.l-main__story').search('p').text
  {
    title: title,
    date: date,
    author: author.strip,
    content: content
  }
end

first_urls = fetch_articles_url("https://globalnews.ca/tag/childrens-mental-health/")
second_urls = fetch_articles_url("https://globalnews.ca/tag/teen-mental-health/")
# scrape the urls and save them as new article instances
puts "there are #{first_urls.count} article urls."
count = 0
first_urls.each do |url|
  article = scrape_article(url)
  Article.create(article)
  puts "done making article #{count + 1}"
  count += 1
end
puts "first articles completed"

puts "there are #{second_urls.count} article urls."
count = 0
second_urls.each do |url|
  article = scrape_article(url)
  Article.create(article)
  puts "done making article #{count + 1}"
  count += 1
end
puts "second articles completed"

puts "making fake stats"
Statistic.destroy_all
1000.times do
  Statistic.create(
    tone: rand(0..6),
    kid: Kid.first,
    created_at: rand((DateTime.now - 1.months)..DateTime.now)
  )
end
puts "done with stats"
