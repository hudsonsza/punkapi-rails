class Beer
  
  include Mongoid::Document
  include Mongoid::Timestamps
  # include Mongoid::Attributes::Dynamic
  include WillPaginate::Mongoid::CriteriaMethods

  has_many :food_pairings
  has_and_belongs_to_many :pubs

  field :name, type: String
  field :description, type: String
  field :image_url, type: String

  validates_presence_of :name, :description

end