class SearchBox
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :text, type: String
  field :ip, type: String
end
