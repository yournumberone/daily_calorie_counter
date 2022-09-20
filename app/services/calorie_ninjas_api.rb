# frozen_string_literal: true

# get each one not existed product info and create
class CalorieNinjasApi
  class << self
    def create_product(meal)
      response = call_ninja_api(meal)
      items = JSON.parse(response.body)['items']
      items.each do |item|
        Product.create(item.symbolize_keys.slice(:name, :calories, :protein_g, :fat_total_g, :carbohydrates_total_g))
      end
    end

    def take_items(meal)
      response = call_ninja_api(meal)
      JSON.parse(response.body)['items']
    end

    private

    def call_ninja_api(meal)
      headers = { 'X-Api-Key': ENV.fetch('CALORIE_NINJAS_KEY') }
      HTTParty.get(ENV.fetch('CALORIE_NINJAS_URL'), query: { query: meal }, headers:)
    end
  end
end
