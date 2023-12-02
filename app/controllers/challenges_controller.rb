class ChallengesController < ApplicationController
  def show
    @questions = [
      { question: "What is the primary use of a katana?", options: ["Cutting", "Thrusting", "Throwing"], correct_answer_index: 0 },
      { question: "Which Japanese swordsmith is famous for creating exceptional katanas?", options: ["Masamune", "Hattori Hanzo", "Miyamoto Musashi"], correct_answer_index: 0 },
      { question: "What is the name of the curved guard at the end of the handle of a katana?", options: ["Tsuba", "Tsuka", "Saya"], correct_answer_index: 0 },
    ]

    question_index = params[:question].to_i
    current_question = @questions[question_index]

    @question = current_question[:question]
    @options = current_question[:options]
    @correct_answer_index = current_question[:correct_answer_index]

    if params[:answer]
      @user_answer_index = params[:answer][question_index].to_i
      @correct = (@user_answer_index == @correct_answer_index)
    end
  end
end
