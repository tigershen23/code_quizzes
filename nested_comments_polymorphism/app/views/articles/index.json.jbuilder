json.array!(@articles) do |article|
  json.extract! article, :id, :body, :title
  json.url article_url(article, format: :json)
end
