class Menu < ActiveRecord::Base
  belongs_to :menu_type

  mount_uploader :image, Uploader

  # limit 2mo
  validates :image, presence: true, file_size: { maximum: 2097152 }

  after_destroy :remove_image_folder

  private
  def remove_image_folder
    store_dir = image.store_dir
    remove_image!
    FileUtils.remove_dir("#{Padrino.root}/public/#{store_dir}", :force => true)
  end
end
