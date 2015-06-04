class Activitat < ActiveRecord::Base
  belongs_to :user

  attr_accessor :dist

  has_attached_file :cover,
                    styles: {
                        thumb: '100x100>',
                        square: '200x200>',
                        medium: '300x300>',
                        cover: '180x414>', #is gone to 180x320
                        fullscreen: '736x414>',
                        iphone6p: '1920x1080>'
                    },
                    :s3_host_name => 's3-eu-west-1.amazonaws.com'


  validates_attachment :cover, :presence => true
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :cover, :matches => [/png\Z/, /jpe?g\Z/]
  validates_attachment_size :cover,  :less_than => 4.megabytes

  has_attached_file :small_cover,
                    styles: {
                        thumb: '100x100>',
                        cover: '480x1080>'
                    },
                    :s3_host_name => 's3-eu-west-1.amazonaws.com'

  validates_attachment :small_cover, :presence => true
  validates_attachment_content_type :small_cover, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :small_cover, :matches => [/png\Z/, /jpe?g\Z/]
  validates_attachment_size :small_cover,  :less_than => 4.megabytes


  def cover_path
    "#{cover.url(:cover)}"
  end

  def fullscreen_path
    "#{cover.url(:fullscreen)}"
  end

  def iphone6p_path
    "#{cover.url(:iphone6p)}"
  end

  def small_cover_path
    "#{small_cover.url(:cover)}"
  end

  def distance
    "#{dist}"
  end

  ActiveRecord::Base.include_root_in_json = false

  def as_json(options={})
    super(:methods => [:cover_path, :fullscreen_path, :iphone6p_path, :small_cover_path, :distance])
  end

end
