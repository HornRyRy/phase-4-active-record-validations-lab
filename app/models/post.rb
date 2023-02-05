class Post < ApplicationRecord

    ##Object Lifecycle callback

    before_validation :capitalize_category_name

    ## Regular validations

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction), case_sensitive: false}

    def capitalize_category_name
        self.category = self.category.capitalize
    end

    # def true_facts
    #     ##regex below
    #     if [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i].none? {|pattern| title.include? (pattern)}
    #         errors.add(:title "Not clickbaity enough, sir!")
    #     end
    # end
    
    
    #validates :title, exclusion: { in: (True_Facts)}
    # validate :must_not_have_true_facts
    
    # def true_facts
    #     unless title.match?(/True Facts/)
    #         errors.add(:title, "Can't have True Facts")
    #     end
    # end
    
    ##or...ApplicationController
    validates :title, format: {with: /Won't Believe|Secret|Top \d|Guess/}
    
end
