module ApplicationHelper
  def render_list(collection)
    content_tag(:ul) do
      raw collection_as_lis(collection).join
    end unless collection.empty?
  end

  def bootstrap_class_for flash_type
    mappings = {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }

    mappings[flash_type.to_sym] || flash_type.to_s
  end

  private

  def collection_as_lis(collection)
    collection.map do |item|
      content_tag(:li) { render item }
    end
  end
end
