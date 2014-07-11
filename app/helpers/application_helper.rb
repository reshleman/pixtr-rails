module ApplicationHelper
  def render_list(collection)
    content_tag(:ul) do
      raw collection_as_lis(collection).join
    end
  end

  private

  def collection_as_lis(collection)
    collection.map do |item|
      content_tag(:li) { render item }
    end
  end
end
