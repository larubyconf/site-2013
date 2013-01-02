class Speaker < ActiveRecord::Base
  attr_accessible :bio, :first_name, :last_name, :twitter_handle, :photo

  has_many :presentations, :class_name => 'Presenter'
    
  has_attached_file :photo,
  :storage => :s3,
  :bucket => 'larubyconf',
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path => "/:class/:id-:style.:extension",
  :default_url => "http://placehold.it/150x150",
  :styles => {
    :small => '50x50',
    :medium => '150x150',
    :large =>  '300x300',
    :full_size => '600x600'
  }

  def full_name
    [first_name, last_name].join(" ")
  end
end
