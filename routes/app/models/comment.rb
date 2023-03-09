

class Comment < ApplicationRecord


    belongs_to :artwork,
       inverse_of: :comments

    belongs_to :author,
        class_name: 'User',
        inverse_of: :comments

end