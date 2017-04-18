class Pub
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include WillPaginate::Mongoid::CriteriaMethods

  has_and_belongs_to_many :beers

  field :name, type: String
  field :address, type: String

  validates_presence_of :name, :address
  validates_uniqueness_of :name

end