json.id user.id
json.first_name user.first_name
json.last_name user.last_name
json.email user.email
json.prayers user.prayers, partial: "prayers/prayer", as: :prayer
json.created_at user.created_at
json.updated_at user.updated_at
