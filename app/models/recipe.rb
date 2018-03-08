class Recipe < ActiveRecord::Base
    belongs_to :category
    validates_presence_of :title, :ingredients, :instructions
    validates :title, uniqueness: true

    def self.find_all_by_query(query)
        query = query.downcase
        query = "%#{query}%"
        
        Recipe.where(['lower(title) like ?', query])
    end    

    def self.find_all_by_query(query)
        query = query.downcase
        query = "%#{query}%"
        Recipe.where(['lower(title) like ?
        OR lower(ingredients) like ?
        OR lower(instructions) like ?',
        query, query, query])
    end

end
