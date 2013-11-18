class Page < ActiveRecord::Base
	belongs_to :page
	has_many :pages, dependent: :destroy
	
	validates :title, presence: true,
                    length: { minimum: 5 }
	validates :summary, presence: true,
                    length: { minimum: 5 }
    validates :body, presence: true,
                    length: { minimum: 5 }


	searchable do
		text :title
		text :summary
		text :body

		integer :id
	end
end
