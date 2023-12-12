class Song
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :author, type: String

  embedded_in :playlist
end
