##
# the sponsor object represents a conference sponsor
class Sponsor < ActiveRecord::Base
  attr_accessible :name, :level, :sponsored_at, :primary_contact_id,
    :message, :logo, :note, :url, :twitter_handle

  belongs_to :primary_contact, :class_name => 'User'

  belongs_to :created_by, :class_name => 'User',
    :foreign_key => 'created_by_user_id'
  belongs_to :updated_by, :class_name => 'User',
    :foreign_key => 'updated_by_user_id'


  has_attached_file :logo,
  :storage => :s3,
  :bucket => 'larubyconf',
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path => "/:class/:id-:style.:extension",
  :default_url => "http://placehold.it/150x50",
  :styles => {
    :small => '50x50',
    :medium => '150x150',
    :full_size => '600x600'
  }

  scope :all_active, order('level asc, sponsored_at asc')

  ##
  # the name of the company / organization / individual who is
  # providing sponsorship
  # :attr: name

  ##
  # the level at which this sponsor is buying in at
  # :attr: level

  ##
  # the date that the sponsor came on board
  # :attr: sponsored_at

  ##
  # the marketing message that the sponsor wants on the site
  # :attr: message

  ##
  # the logo the sponsor wishes to use
  # :attr: logo

  ##
  # special notes about the sponsorship
  # :attr: note

  ##
  # the url that is this sponsors external link
  # :attr: url

  default_scope :order => 'level, sponsored_at'

  scope :level, proc {|level| where(:level => level)}

  LEVELS = ['1-platinum','2-gold','3-silver','4-bronze','5-supporter']

  def self.levels
    LEVELS
  end
end
