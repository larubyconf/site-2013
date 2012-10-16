module MainHelper
  def display_truncated_body news_item
    truncate(news_item.body, :separator => ' ', :length => 240, :omission => "#{link_to '... (continued)', news_item_path(news_item)}")
  end
end
