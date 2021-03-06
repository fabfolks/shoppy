class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, :allow_destroy => true

  include TheRole::User

  def owner?(object)
    return Exception.new("Cannot determine ownership.") unless object.respond_to?(:user_id)
    return object.user_id == self.id
  end
end
