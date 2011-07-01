module ApplicationHelper
  def raw_br(str)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end
end
