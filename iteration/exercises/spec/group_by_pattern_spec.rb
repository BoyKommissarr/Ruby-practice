RSpec.describe 'group by pattern' do

  it 'by word length' do
    words = ["sue", "alice", "steve", "sally", "adam", "fort", "tops", "dog", "cat"]
    grouped = Hash.new {|hash, key| hash[key] = []}
    words.each do |word|
      grouped[word.length] << word
    end
    expected = {3=>["sue", "dog", "cat"], 4=>["adam", "fort", "tops"], 5=>["alice", "steve", "sally"]}
    expect(grouped).to eq(expected)
  end

  it 'by odd and even' do
    numbers = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    odd_and_even = Hash.new {|hash, key| hash[key] = []}
    numbers.each do |number|
      if number.even? == true
        odd_and_even[0]<<number
      else
        odd_and_even[1]<<number
      end
    end
    expected = {1=>[1, 1, 3, 5, 13, 21, 55], 0=>[2, 8, 34]}
    expect(odd_and_even).to eq(expected)
  end

  it 'by first letter' do
    words = ["ant", "axis", "albatross", "bolt", "badge", "butter", "car", "cdr", "column"]
    words_by_first_letter = Hash.new {|hash, key| hash[key] = []}
    words.each do |word|
      if word[0] == "a"
        words_by_first_letter["a"]<<word
      elsif word[0] == "b"
        words_by_first_letter["b"]<<word
      elsif word[0] == "c"
        words_by_first_letter["c"]<<word
      end
    end
    expected = {"a"=>["ant", "axis", "albatross"], "b"=>["bolt", "badge", "butter"], "c"=>["car", "cdr", "column"]}
    expect(words_by_first_letter).to eq(expected)
  end

  it 'by uniqueness' do
    words = ["one", "two", "one", "TWO", "three", "one", "three", "three", "three"]
    grouped = Hash.new{|hash, key| hash[key] = []}
    words.each do |word|
      if word.downcase == "one"
        grouped["one"]<<word
      elsif word.downcase == "two"
        grouped["two"]<<word
      elsif word.downcase == "three"
        grouped["three"]<<word
      end
    end
    expected = {"one"=>["one", "one", "one"], "two"=>["two", "TWO"], "three"=>["three", "three", "three", "three"]}
    expect(grouped).to eq(expected)
  end

  it 'by number of zeroes' do
    numbers = [1, 3, 500, 200, 4000, 3000, 10000, 90, 20, 500000]
    grouped = Hash.new{ |hash, key| hash[key] = []}
    numbers.each do |num|
      if num.digits.length == 1
        grouped[0]<<num
      elsif num.digits.length == 3
        grouped[2]<<num
      elsif num.digits.length == 4
        grouped[3]<<num
      elsif num.digits.length == 5
        grouped[4]<<num
      elsif num.digits.length == 2
        grouped[1]<<num
      elsif num.digits.length == 6
        grouped[5]<<num
      end
    end
    expected = {0=>[1, 3], 2=>[500, 200], 3=>[4000, 3000], 4=>[10000], 1=>[90, 20], 5=>[500000]}
    expect(grouped).to eq(expected)
  end

  it 'by order of magnitude' do
    numbers = [1, 3, 503, 239, 4938, 3932, 19982, 93, 21, 501787]
    grouped = Hash.new{ |hash, key| hash[key] = []}
    numbers.each do |num|
      if num.digits.length == 1
        grouped[1]<<num
      elsif num.digits.length == 2
        grouped[2]<<num
      elsif num.digits.length == 3
        grouped[3]<<num
      elsif num.digits.length == 4
        grouped[4]<<num
      elsif num.digits.length == 5
        grouped[5]<<num
      elsif num.digits.length == 6
        grouped[6]<<num
      end
    end
    expected = {1=>[1, 3], 2=>[93, 21], 3=>[503, 239], 4=>[4938, 3932], 5=>[19982], 6=>[501787]}
    expect(grouped).to eq(expected)
  end
end
