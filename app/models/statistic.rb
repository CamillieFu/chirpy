class Statistic < ApplicationRecord
  belongs_to :kid

  # not sure if it will appear with an underscore or not. If it does, maybe a different word would be better.
  enum tone: { joy: 0, analytical: 1, tentative: 2,
               confident: 3, fear: 4, sadness: 5, anger: 6, censored: 7, unverified: 8 }
end
