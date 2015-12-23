module BallsHelper
  
  def remove_trailer_zeroes value
    value.to_i == value ? value.to_i : value
  end
  
  def ball_text ball, blank_char = ''
    return blank_char if ball.nil? || (ball.value.blank? && ball.note.blank?)
    value = ball.value.present? ? remove_trailer_zeroes(ball.value) : ''
    return "#{value} #{ball.note || ''}"
  end
  
end
