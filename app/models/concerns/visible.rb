# 參考 https://railsbook.tw/chapters/25-organize-your-code.html
# 以及 https://guides.rubyonrails.org/getting_started.html
module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ["public", "private", "archived"]

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # class_method 等同於 module ClassMethods
  class_methods do
    def public_count
      where(status: "public").count
    end
  end

  def archived?
    status == "archived"
  end
end