class Activitat < ActiveRecord::Base
  belongs_to :user

  has_attached_file :cover,
                    styles: {
                        thumb: '100x100>',
                        square: '200x200>',
                        medium: '300x300>',
                        cover: '640x480>'
                    },
                    :s3_host_name => 's3-eu-west-1.amazonaws.com'
  # ,
  #                   :s3_credentials => "#{Rails.root}/config/application.yml"


  validates_attachment :cover, :presence => true
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :cover, :matches => [/png\Z/, /jpe?g\Z/]
  validates_attachment_size :cover,  :less_than => 10.megabytes


  def full_path
    "#{cover.url(:medium)}"
  end

  ActiveRecord::Base.include_root_in_json = false

  def as_json(options={})
    super(:methods => [:full_path])
  end
end
