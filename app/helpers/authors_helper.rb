module AuthorsHelper
  def validation_status(model)
    if model.valid?
      content_tag :span, 'válido!', class: 'text-green-500'
    else
      content_tag :span, model.errors.full_messages.to_sentence, class: 'text-red-500'
    end
  end
end
