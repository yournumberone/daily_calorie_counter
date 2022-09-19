# frozen_string_literal: true

# get each one not existed product info and create
class CalorieNinjasApi
  class << self
    def call(product)
      headers = { 'X-Api-Key': ENV.fetch('CALORIE_NINJAS_KEY') }
      response = HTTParty.get(ENV.fetch('CALORIE_NINJAS_URL'), query: { query: product }, headers:)
      create_product(response) if response.code == 200
    end

    def take_items(meal)
      headers = { 'X-Api-Key': ENV.fetch('CALORIE_NINJAS_KEY') }
      response = HTTParty.get(ENV.fetch('CALORIE_NINJAS_URL'), query: { query: meal }, headers:)
      JSON.parse(response.body)['items']
    end

    private

    def create_product(response)
      items = JSON.parse(response.body)['items']
      items.each do |item|
        Product.create(item.symbolize_keys.slice(:name, :calories, :protein_g, :fat_total_g, :carbohydrates_total_g))
      end
    end
  end
end
