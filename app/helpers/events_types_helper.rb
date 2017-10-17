module EventsTypesHelper
  def get_icon_image_data event_type
    "data:image/png;base64,#{Base64.strict_encode64 event_type.icone}"
  end
end
