module GFormsHelper
  def find_option(option_id)
    Option.find(option_id).title
  end

  def find_question(question_id)
    Question.find(question_id).title
  end

  def display_answer(question_id, answer)
    question = find_question(question_id)
    if question.type_of_question == 'multiselect'
      display_multiselect_answer(answer)
    elsif question.type_of_question == 'radio_button'
      display_radio_button_answer(answer)
    else
      answer
    end
  end

  def display_multiselect_answer(answer)
    options = Option.where(id: answer)
    options.map(&:title).join(', ')
  end

  def display_radio_button_answer(answer)
    Option.find(answer).title
  end
end
