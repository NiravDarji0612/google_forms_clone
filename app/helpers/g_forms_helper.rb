module GFormsHelper
  def find_option(option_id)
    Option.find(option_id).title
  end

  def find_question(question_id)
    Question.find(question_id).title
  end
end
