class Activity < ApplicationRecord
    belongs_to :user
    
    paginates_per 7
end
