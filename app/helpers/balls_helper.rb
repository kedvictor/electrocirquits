module BallsHelper
  
  def ball_text ball
    return '-' if ball.nil? || ball.value.nil?
    ball.value.to_i == ball.value ? ball.value.to_i : ball.value
  end
  
  def ball_form_text ball
    return '' if ball.nil? || ball.value.nil?
    ball.value.to_i == ball.value ? ball.value.to_i : ball.value
  end
  
end
