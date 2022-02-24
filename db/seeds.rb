
puts "Deleting users ..."
User.destroy_all
puts "Done."
puts "Creating users ..."
mom = User.create(email: "mom@gmail.com", password: 1234567, first_name: "Mom", last_name: "Mommy")
dad = User.create(email: "dad@gmail.com", password: 1234567, first_name: "Dad", last_name: "Daddy")
puts "Done."
puts "Creating kids ..."
luke = Kid.new(
  first_name: "Luke",
  last_name: "Benly",
  age: 12,
  birthday: "Wed, Jan 13 2010",
  user: mom
)
brenna = Kid.new(
  first_name: "Brenna",
  last_name: "Bentel",
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
def fetch_articles_url
  global_news_url = "https://globalnews.ca/tag/childrens-mental-health/"
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

fetch_articles_url

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

urls = fetch_articles_url

# scrape the urls and save them as new article instances
count = 0
articles = []
puts "there are #{urls.count} article urls."
urls.each do |url|
  article = scrape_article(url)
  new_article = Article.create(article)
  puts "done making article #{count + 1}"
  articles << new_article
  count += 1
end
puts "action completed"
