module ResponsesHelper
  def find_question(question_id)
    Question.find(question_id).title
  end

  def display_answer(question_id, answer)
    question = Question.find(question_id)
    if question.type_of_question == 'multiselect'
      options = Option.where(id: answer)
      options.map(&:title).join(', ')
    elsif question.type_of_question == 'radio_button'
      Option.find_by(id: answer)&.title || answer
    else
      answer
    end
  end

  def render_question_options(question)
    return render_text_field(question) if question.options.empty?

    case question.type_of_question
    when 'multiselect'
      render_multiselect_options(question)
    when 'radio_button'
      render_radio_button_options(question)
    when 'text'
      render_text_field(question)
    when 'text_area'
      render_text_area(question)
    else
      ''
    end
  end

  private

  def render_multiselect_options(question)
    options_html = question.options.map do |option|
      checkbox_tag = check_box_tag "response[answers][#{question.id}][]", option.id, false, id: "response_#{question.id}_#{option.id}"
      label_tag = label_tag "response_#{question.id}_#{option.id}", option.title, for: "response_#{question.id}_#{option.id}"
      content_tag(:div, checkbox_tag + label_tag)
    end
    options_html.join('').html_safe
  end

  def render_radio_button_options(question)
    options_html = question.options.map do |option|
      radio_button_tag = radio_button_tag "response[answers][#{question.id}]", option.id, false, id: "response_#{question.id}_#{option.id}"
      label_tag = label_tag "response_#{question.id}_#{option.id}", option.title, for: "response_#{question.id}_#{option.id}"
      content_tag(:div, radio_button_tag + label_tag)
    end
    options_html.join('').html_safe
  end

  def render_text_field(question)
    text_field_tag "response[answers][#{question.id}]", nil
  end

  def render_text_area(question)
    text_area_tag "response[answers][#{question.id}]", nil
  end
end
