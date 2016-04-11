class SearchAnalytic
  include Mongoid::Document
  field :text, type: String
  field :count, type: Integer
end
