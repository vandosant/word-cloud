require_relative '../lib/word_cloud'
require 'json'
require 'pp'

input = JSON.parse(File.read'../data/quotes.json')

cloud = WordCloud.new(input)

pp cloud.hashify