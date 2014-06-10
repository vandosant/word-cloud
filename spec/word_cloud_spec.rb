require 'rspec'
require_relative '../lib/word_cloud'

describe WordCloud do
  it "finds words and the person who said them" do
    input = {
              "Ron Berry" => ['Value people']
            }

    cloud = WordCloud.new(input)

    actual = cloud.hashify

    expected = {
                'value' => { :count => 1, :people => ['Ron Berry'] },
                'people' => { :count => 1, :people => ['Ron Berry'] },
                }

    expect(actual).to eq expected
  end

  it "associates multiple people with a word" do
    input = {
      "Ron Berry" => ['Value people'],
      "Debra Brown" => ['Optimize value']
    }

    cloud = WordCloud.new(input)

    actual = cloud.hashify

    expected = {
      'value' => { :count => 2, :people => ['Ron Berry', 'Debra Brown'] },
      'people' => { :count => 1, :people => ['Ron Berry'] },
      'optimize' => { :count => 1, :people => ['Debra Brown'] }
    }

    expect(actual).to eq expected
  end
end