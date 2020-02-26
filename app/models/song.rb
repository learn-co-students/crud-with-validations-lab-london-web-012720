class Song < ApplicationRecord
    validates :title, presence: true
    validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [ true, false ] }
    validates :release_year, presence: true, if: :is_released
    

    def is_released
        self.released
    end
end
