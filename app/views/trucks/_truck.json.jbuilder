json.extract! truck, :id, :model, :max_weight, :max_volume, :driver_id, :created_at, :updated_at
json.url truck_url(truck, format: :json)