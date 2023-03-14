module ApplicationHelper
  def user_photo(user, options = {})
    default_url = "https://cdn-icons-png.flaticon.com/512/2119/2119043.png"

    if user.photo.attached?
      cl_image_tag(user.photo.key, options)
    else
      image_tag(default_url, options)
    end
  end
end
