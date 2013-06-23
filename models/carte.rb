class Carte < ActiveRecord::Base
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  mount_uploader :image, Uploader

  # limit 2mo
  validates :name, presence: true
  validates :image, presence: true, file_size: { maximum: 2097152 }

  after_destroy :remove_image_folder

  private
  def remove_image_folder
    store_dir = image.store_dir
    remove_image!
    FileUtils.remove_dir("#{Padrino.root}/public/#{store_dir}", :force => true)
  end
end
