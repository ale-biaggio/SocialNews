class UserReport < ApplicationRecord
    has_one_attached :report_image, dependent: :destroy
end
