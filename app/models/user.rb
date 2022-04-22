class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one_attached :profile_picture

  #Validations
  validates_presence_of :name
  validates :name, length: { minimum: 3 , message: "cannot be less than 3 characters" }
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/ , message: "is invalid"


 
end
