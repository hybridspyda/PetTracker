json.extract! pet, :id, :name, :species, :breed, :variety, :sex, :date_of_birth, :is_approx_dob, :date_of_death, :gotcha_day, :user_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
