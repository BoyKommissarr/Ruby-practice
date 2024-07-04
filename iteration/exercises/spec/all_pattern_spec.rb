RSpec.describe 'all pattern' do
  it 'test 1' do
    account_balances = [0, 0, 0, 0, 0, 0, 0]
    all_zeros = true
    # account_balances.each do |balance|
    #   all_zeros = false unless balance.zero?
    # end
    all_zeros = account_balances.all?{ |balance| balance.zero?}
    expect(all_zeros).to be true
  end

  it 'test 2' do
    account_balances = {
      checking: 0,
      saving: 0,
      retirement_401k: 0,
      retirement_ira: 0,
    }
    all_zeros = true
    account_balances.each do |account, balance|
      if !balance.zero?
        all_zeros = false
      end
    end
    #all_zeros = account_balances.all?{ |balance,amount| amount.zero?}
    expect(all_zeros).to be true
  end

  it 'test 3' do
    words = ["love", "hate", "fire", "bird", "call"]
    all_four_letters = true
    words.each do |word|
      if word.length != 4
        all_four_letters = false
      end
    end
    #all_four_letters = words.all? { |word| word.length == 4}
    expect(all_four_letters).to be true
  end

  it 'test 4' do
    words = {
      one: "love",
      two: "hate",
      three: "fire",
      four: "bird",
      five: "call"
    }
    all_four_letters = true
    words.each do |position, word|
      if word.length != 4
        all_four_letters = false
      end
    end
    #all_four_letters = words.all?{ |position, word| word.length == 4}
    expect(all_four_letters).to be true
  end

  it 'test 5' do
    statuses = [:busy, :busy, :busy]
    all_busy = true
    statuses.each do |status|
      if status != :busy
        all_busy = false
      end
    end
    # all_busy = statuses.all? { |status| status == :busy }
    expect(all_busy).to be true
  end

  it 'test 6' do
    friend_status = {
      "Megan" => :busy,
      "Sarah" => :busy,
      "Duncan" => :busy,
    }
    all_busy = true
    friend_status.each do |friend, status|
      if status != :busy
        all_busy = false
      end
    end
    all_busy = friend_status.all? { |friend, status| status == :busy}
    expect(all_busy).to be true
  end

  it 'test 7' do
    zip_codes = [94381, 831, 50009, 36232, 8992, 89999, 11110]
    all_five_digits = true
    zip_codes.each do |num|
      if num.digits.length == 5
        all_five_digits = false
      end
    end
    expect(all_five_digits).to be false
  end

  it 'test 8' do
    zip_codes = {
      "Megan" => 94381,
      "Sarah" => 831,
      "Duncan" => 50009,
      "Raymart" => 36232,
      "Alec" => 89092,
      "Cameron" => 89999,
      "Joshua" => 11110
    }
    all_five_digits = true
    zip_codes.each do |name,code|
      if code.digits.length != 5
        all_five_digits = false
      end
    end
    all_five_digits = zip_codes.all?{ |name, code| code.digits.length == 5}
    expect(all_five_digits).to be false
  end

  it 'test 9' do
    snacks = ["GARLIC PLANTAINS", "SNICKERDOODLES", "Pretzels"]
    all_caps = true
    snacks.each do |item|
      if (item.split('').grep(/[a..z]/).length.zero?)
        all_caps = false
      end
    end
    all_caps = snacks.all?{ |item| item.split('').grep(/[a..z]/).length.zero?}
    expect(all_caps).to be false
  end

  it 'test 10' do
    snacks = {
      savory: "GARLIC PLANTAINS",
      sweet: "SNICKERDOODLES",
      salty: "Pretzels"
    }
    all_caps = false
    snacks.each do |taste,item|
      if (item.split('').grep(/[a..z]/).length.zero?)
        all_caps = false
      end
    end
    all_caps = snacks.all?{ |taste,item| item.split('').grep(/[a..z]/).length.zero?}
    expect(all_caps).to be false
  end
end
