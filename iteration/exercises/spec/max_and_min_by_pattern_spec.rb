RSpec.describe 'max and min by pattern' do
  it 'test 1'  do
    numbers = [1, 100, 1000, 1000000]
    greatest = numbers[0]
    numbers.each do |number|
      if number > greatest
        greatest = number
      end
    end
    expect(greatest).to eq(1000000)
  end

  it 'test 2' do
    magnitudes = {
      ones: 1,
      hundreds: 100,
      thousands: 1000,
      millions: 1000000
    }
    greatest = magnitudes[magnitudes.keys[0]]
    magnitudes.each do |name, value|
      if value > greatest
        greatest = value
      end
    end
    expect(greatest).to eq(1000000)
  end

  it 'test 3' do
    meals = ["banana", "nuts", "salad", "steak", "cake"]
    shortest_word = meals[0]
    meals.each do |meal|
      if meal.length < shortest_word.length
        shortest_word = meal
      end
    end

    expect(shortest_word).to eq("nuts")
  end

  it 'test 4' do
    meals = {
      breakfast: "banana",
      snack: "nuts",
      lunch: "salad",
      dinner: "steak",
      dessert: "cake"
    }
    shortest_word = meals[meals.keys.first]
    meals.each do |meal, dish|
      if dish.length<shortest_word.length
        shortest_word = dish
      end
    end

    expect(shortest_word).to eq("nuts")
  end

  it 'test 5' do
    stats = [3001, 431, 1695, 0.27601, 0.340]
    most_digits = stats[0]
    stats.each do |num|
      if num.to_s.split('').length > most_digits.to_s.split('').length
        most_digits = num
      end
    end
    # most_digits = stats.max { |n| num.to_s.split('').length }
    expect(most_digits).to eq(0.27601)
  end

  it 'test 6' do
    stats = {
      games_played: 3001,
      home_runs: 431,
      rbi: 1695,
      batting_average: 0.27601,
      on_base_percentage: 0.340
    }
    most_digits = stats[stats.keys.first]
    stats.each do |stat,num|
      if num.to_s.split('').length > most_digits.to_s.split('').length
        most_digits = num
      end
    end
    # most_digits = stats.max { |n| num.to_s.split('').length }
    expect(most_digits).to eq(0.27601)
  end

  it 'test 7' do
    ages = [39, 45, 29, 24, 50]
    oldest = ages[0]
    ages.each do |age|
      if age > oldest
        oldest = age
      end
    end
    expect(oldest).to eq(50)
  end

  it 'test 8' do
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 29,
      margaret: 24,
      miguel: 50
    }
    oldest = {}
    max = 39
    ages.each do |name,age|
      if age > max
        oldest = {name: name.to_s, age: age}
        max = age
      end
    end
    # oldest = ages.max do |a, b|
    #   puts a[1]
    #   puts b[1]
    #   puts a[1] < b[1]
    #   a[1] < b[1]
    # end
    expected = {name: "miguel", age: 50}
    expect(oldest).to eq(expected)
  end

  it 'test 9' do
    programmers = [["katrina", "sandi", "jim", "aaron", "desi"], ["abby", "jon", "susan"]]
    fewest_programmers = programmers[0].length
    programmers.each do |programmer|
      if programmer.length<fewest_programmers
        fewest_programmers = programmer
      end
    end
    expect(fewest_programmers).to eq(["abby", "jon", "susan"])
  end

  it 'test 10' do
    programmers = {ruby: ["katrina", "sandi", "jim", "aaron", "desi"], java: ["abby", "jon", "susan"]}
    fewest_programmers = programmers[programmers.keys.first].length
    programmers.each do |language,programmers|
      if programmers.length<fewest_programmers
        fewest_programmers = language
      end
    end
    expect(fewest_programmers).to eq(:java)
  end
end
