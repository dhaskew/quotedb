#!/usr/bin/env ruby

require 'open-uri'
require 'rss'


url = 'http://feeds.feedburner.com/quotationspage/mqotd'

open(url) do |rss|
  feed = RSS::Parser.parse(rss,do_validate=false)
  
  feed_size = feed.items.size

  
  #puts "Title: #{feed.channel.title}"
  x = 1
  feed.items.each do |item|
    #puts item if x < 4

    if x < 2
      author =  item.title
      #puts "author: "+ author
      quote = item.description.match('(^".*)').to_s
      #puts "quote: " + quote
      
      geektool = quote + "  ---  " + author
      
      puts geektool
      
    end 
    x = x + 1

  end
  
end