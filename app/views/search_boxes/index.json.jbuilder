json.array!(@search_boxes) do |search_box|
  json.extract! search_box, :id, :text, :ip
  json.url search_box_url(search_box, format: :json)
end
