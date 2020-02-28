class Song < ApplicationRecord

    validates :title, presence: true, uniqueness: {scope: [:artist_name, :released_year],
     message: "The title %{value} has been used alredy"}
    validates :released, inclusion: {in: [true, false]}
    validates :released_year, presence: {message: "if you released the song you need to specify the year "}, if: :released? 

#for released_year if released is false not required else yers


        def released? 
            self.released == true
        end

end
