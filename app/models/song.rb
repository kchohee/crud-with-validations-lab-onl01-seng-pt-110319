class Song < ApplicationRecord
    validates :title, presence: true, uniqueness:{scope: %i[artist_name release_year], message: 'Titles that are the exact same must have different release years if they are by the same artist.'}
    validates :released, inclusion: {in: [true, false]}, exclusion:{in: [nil]}
    validates :artist_name, presence: true

    with_options if: :released? do |s|
        s.validates :release_year, presence: true
        s.validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}
    end

    def released?
        released == true
    end
end


  

   