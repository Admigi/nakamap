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
    points_for_correct_answer = 10  # Adjust points
    points_for_time_taken = 5
    
    selected_options = params[:challenge][:selected_options]

    unless selected_options.nil?
      selected_options.each_with_index do |selected_option, index|
        question = questions[index]
        correct_option = question['correct_option']

        if selected_option == correct_option
          correct_answers += 1
        end
      end
    end

    # Calculate points based on correct answers and time taken
    points_for_correct_answers = correct_answers * points_for_correct_answer
    points_for_time_taken = calculate_points_for_time_taken(params[:time_taken].to_i)

    total_points = points_for_correct_answers + points_for_time_taken

    flash[:notice] = "You answered #{correct_answers} out of #{total_questions} questions correctly."
    flash[:notice] += " You earned #{points_for_correct_answers} points for correct answers and #{points_for_time_taken} points for time taken."
    flash[:notice] += " Total points: #{total_points}"

    current_user.update(points: current_user.points + total_points)
    redirect_to challenges_path
  end

  private

  def calculate_points_for_time_taken(time_taken)
    # Logic based on the time / good answer
    max_points = 20  # Maximum points for time taken
    time_limit = @challenge.metadata['time_limit'] || 300  # Default time limit in seconds

    # Calculate points based on the ratio of time_taken to time_limit
    time_ratio = [1.0, time_taken.to_f / time_limit].min
    points_for_time_taken = (max_points * (1 - time_ratio)).round

    # Ensure the points are not negative
    points_for_time_taken.positive? ? points_for_time_taken : 0
  end
end