class Activitat < ActiveRecord::Base
  belongs_to :user

  has_attached_file :cover,
                    styles: {
                        thumb: '100x100>',
                        square: '200x200',
                        medium: '300x300>'
                    },
                    :s3_host_name => 's3-eu-west-1.amazonaws.com'

  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  def full_path
    "#{cover.url(:medium)}"
  end

  ActiveRecord::Base.include_root_in_json = false

  def as_json(options={})
    super(:methods => [:full_path])
  end
end
