class User < ApplicationRecord
    authenticates_with_sorcery!

    validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
    validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
    validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
    
    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, uniqueness: true
    # validates :reset_password_token, presence: true, allow_nil: true
    
    has_many :items, dependent: :destroy
    
    # enum role: { general: 0, admin: 1 }
    
    # def mine?(object)
    #     id == object.user_id
    # end
    def own?(item)
        self.id == item.user_id
    end
end
