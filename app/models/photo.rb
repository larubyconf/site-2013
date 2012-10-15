##
# the photo object stores photos used in display on the web-site
class Photo < ActiveRecord::Base
  attr_accessible :caption, :image, :sort_index

  has_attached_file :image,
  :storage => :s3,
  :bucket => 'larubyconf',
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path => "/:class/:id-:style.:extension",
  :default_url => "http://placehold.it/400x300",
  :styles => {
    :full_size => '800x600',
    :display => '600x450',
    :standard => '400x300',
    :small => '200x150',
    :thumb => '100x75'
  }

end
