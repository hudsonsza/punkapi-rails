class FoodPairing
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :beer

  field :description, type: String
  
  validates_presence_of :description

end