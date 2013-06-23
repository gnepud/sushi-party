class Item < ActiveRecord::Base
  belongs_to :carte

  def to_s
    "#{name}, #{price}"
  end
end
