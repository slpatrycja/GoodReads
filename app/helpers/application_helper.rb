module ApplicationHelper
  def resource_name(resource)
    resource.class.name.underscore.humanize(capitalize: false)
  end
end
