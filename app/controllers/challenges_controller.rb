class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end
  
  def show
    @challenge = Challenge.find(params[:id])
  end

  def check_answer
    @challenge = Challenge.find(params[:id])
    questions = @challenge.metadata['questions']
    total_questions = questions.length
    correct_answers = 0
  
    selected_options = params[:challenge][:selected_options]
  
    unless selected_options.nil?
      selected_options.each_with_index do |selected_option, index|
        question = questions[index]
  
        # Debugging lines to check data and comparisons
        puts "Question: #{question}"
        puts "Correct Option (Challenge): #{@challenge.correct_option}"
        puts "Correct Option (Question): #{question['correct_option']}"
        puts "Selected Option: #{selected_option}"
  
        correct_option = question['correct_option']
  
        if selected_option == correct_option
          correct_answers += 1
        end
      end
    end
  
    flash[:notice] = "You answered #{correct_answers} out of #{total_questions} questions correctly."
    redirect_to root_path
  end  
end