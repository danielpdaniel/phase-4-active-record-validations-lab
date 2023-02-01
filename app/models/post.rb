class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait_titles, 

    def clickbait_titles
        # byebug
        if !title
            errors.add(:title, "title cannot be blank!")
        
    elsif !title.downcase.include?("won't believe") && !title.downcase.include?("secret") && !title.downcase.include?("top ") && !title.downcase.include?("guess") 
        errors.add(:title, "must include clickbait title!")
       end
    end


end
