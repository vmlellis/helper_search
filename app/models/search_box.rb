class SearchBox
  include Mongoid::Document

  field :text, type: String
  field :ip, type: String
end
