# == Schema Information
#
# Table name: books
#
#  id                    :integer          not null, primary key
#  title                 :string
#  description           :text
#  author                :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#  category_id           :integer
#  book_img_file_name    :string
#  book_img_content_type :string
#  book_img_file_size    :integer
#  book_img_updated_at   :datetime
#

class Book < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :book_img, styles: { book_index: "250x350>", book_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/
end
