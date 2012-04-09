module UserContentServicesHelper
  def make_field name, attributes
    case attributes[0]["fieldType"][0]
      when "TEXT", "LOGIN", "URL", "CUSTOM" then make_text_field(name, attributes)
      when "PASSWORD" then make_password_field(name, attributes)
      when "CHECKBOX" then make_checkbox_field(name, name)
    end
  end

  def make_multi_field name, value, type
    case type
      when "OPTION" then make_checkbox_field(name, value)
      when "RADIO" then make_radio_field(name, value)
    end
  end

  def make_text_field name, attributes
    text_field_tag name, nil, :placeholder => name, :id => name, :maxlength => attributes[0]["maxLength"]
  end

  def make_password_field name, attributes
    password_field_tag name, nil, :placeholder => name, :id => name, :maxlength => attributes[0]["maxLength"]
  end

  def make_checkbox_field name, value
    check_box_tag name, value
  end

  def make_radio_field name, display_name
    radio_button_tag name, display_name
  end

end