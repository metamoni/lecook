# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    title { 'Baked sweet potatoes with avocado' }
    instructions { 'Bake the potato. Put things on it. Eat it' }
  end
end
