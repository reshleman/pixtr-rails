module ApplicationHelper
  def bootstrap_class_for flash_type
    mappings = {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }

    mappings[flash_type.to_sym] || flash_type.to_s
  end
end
