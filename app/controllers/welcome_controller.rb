class WelcomeController < ApplicationController
	def index
		if request.post?
		# google
		url1 = URI.escape("http://www.google.com/search?q=#{params[:search]}")
		doc1 = Nokogiri::HTML(open(url1))
		@contents1 = Array.new
		doc1.css('h3 a').each do |link|
			@contents1 << link.content
		end
		# baidu
		url2 = URI.escape("http://www.baidu.jp/s?tn=baidujp&ie=utf-8&wd=#{params[:search]}")
		doc2 = Nokogiri::HTML(open(url2))
		@contents2 = Array.new
		doc2.css('h3 a').each do |link|
			@contents2 << link.content
		end
		# bing
		url3 = URI.escape("http://www.bing.com/search?q=#{params[:search]}")
		doc3 = Nokogiri::HTML(open(url3))
		@contents3 = Array.new
		doc3.css('h3 a').each do |link|
			@contents3 << link.content
		end
		end
	end
end
