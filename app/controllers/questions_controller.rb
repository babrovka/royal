class QuestionsController < ApplicationController
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to :back }
        flash[:notice] = t('question_created')
      else
        format.html { redirect_to :back }
        flash[:notice] = t('fulfill_error')
      end
    end
  end
end
