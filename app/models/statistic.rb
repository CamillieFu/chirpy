class Statistic < ApplicationRecord
  belongs_to :kid

  enum tone: { joy: 0, analytical: 1, tentative: 2,
                 confident: 3, fear: 4, sadness: 5, angry: 6 }
end
