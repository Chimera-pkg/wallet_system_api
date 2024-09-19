class User < ApplicationRecord
  has_one :wallet, as: :entity
end

class Team < ApplicationRecord
  has_one :wallet, as: :entity
end

class Stock < ApplicationRecord
  has_one :wallet, as: :entity
end
