class AnswersController < ApplicationController

    before_action :find_question, only: [:new, :create]
    before_action :find_answer, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @answer = @question.answers.new
    end

    def edit
    end

    def create
        @answer = Answer.new(answer_params)
        respond_to do |format|
            if @answer.save
                redirect_to @answer, notice: 'Answer was successfully created.'
            else
                render :new
            end
        end
    end

    def destroy 
        @answer.destroy
        riderect_to @answer.question
    end

    private

    def find_question
        @question = Question.find(params[:question_id])
    end

    def find_answer
        @answer = Answer.find(params[:id])
    end

    def answer_params
        params.require(:answer).permit(:body, :correct)
    end
end