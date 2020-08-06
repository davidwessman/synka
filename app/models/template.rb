class Template
  SUPPORTED_FIELDS = {
    contact: %i[email name phone],
    space: %i[title]
  }

  def initialize(contact:, content:, fields: nil)
    @contact = contact
    @content = content
    @space = @contact.space
    @fields = fields.present? && fields.is_a?(Hash) ? fields : SUPPORTED_FIELDS
  end

  def message
    Message.new(contact: @contact, content: prepare_message_content)
  end

  private

  def prepare_message_content
    message = @content

    @fields.fetch(:contact, []).each do |key|
      value = contact_value(key)
      next if value.nil?
      message.gsub!("%contact.#{key}%", value)
    end

    @fields.fetch(:space, []).each do |key|
      value = space_value(key)
      next if value.nil?
      message.gsub!("%space.#{key}%", value)
    end

    message
  end

  def contact_value(key)
    return if key.empty?
    key = key.to_sym
    if key == :name
      @contact.name
    elsif key == :phone
      @contact.name
    elsif key == :email
      @contact.name
    end
  end

  def space_value(key)
    return if key.empty?
    key = key.to_sym
    if key == :title
      @space.title
    end
  end
end
