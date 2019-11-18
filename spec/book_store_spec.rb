require_relative '../lib/book_store'
require 'rspec/core'

RSpec.describe BookStore do
  describe "Computes offered discount for"
  context " a single book" do
    basket = [1]
   it { is_expected.to respond_with 8.0 }
  end

  context " two of the same book" do
    basket = [2, 2]
    it { is_expected.to respond_with 16.00 }
  end

  context " empty basket" do
    basket = []
    it { is_expected.to respond_with 0.00 }
  end

  it " three different books" do
    basket = [1, 2, 3]
    expect(BookStore.calculate_price(basket)).to eq 21.60
  end

  it " four different books" do
    basket = [1, 2, 3, 4]
    expect(BookStore.calculate_price(basket)).to eq 25.60
  end

  it " five different books" do
    basket = [1, 2, 3, 4, 5]
    expect(BookStore.calculate_price(basket)).to eq 30.00
  end

  it " two groups of four is cheaper than group of five plus group of three" do
    basket = [1, 1, 2, 2, 3, 3, 4, 5]
    expect(BookStore.calculate_price(basket)).to eq 51.20
  end

  it " two groups of four is cheaper than group of five plus group of three" do
    basket = [1, 1, 2, 3, 4, 4, 5, 5]
    expect(BookStore.calculate_price(basket)).to eq 51.20
  end

  it " two groups of four plus group of two is cheaper than two groups of three" do
    basket = [1, 1, 2, 2, 3, 4]
    expect(BookStore.calculate_price(basket)).to eq 40.80
  end

  it " two each of first 4 books and 1 copy each of rest" do
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5]
    expect(BookStore.calculate_price(basket)).to eq 55.60
  end

  it " two copies of each book" do
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
    expect(BookStore.calculate_price(basket)).to eq 60.00
  end

  it " three copies of first book and 2 each of remaining" do
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1]
    expect(BookStore.calculate_price(basket)).to eq 68.00
  end

  it " three each of first 2 books and 2 each of remaining books" do
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2]
    expect(BookStore.calculate_price(basket)).to eq 75.20
  end

  it " four groups of four are cheaper than two groups each of five and three" do
    basket = [1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5]
    expect(BookStore.calculate_price(basket)).to eq 102.40
  end
end