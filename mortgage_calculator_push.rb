puts "Hi! What's your name?: "
user_name = gets.chomp

puts "Okay, #{user_name}. Let's calculate your monthly mortgage payment."

loop do
  puts "What is your total loan amount? (USD; use _ instead of a comma)"

  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    if loan_amount.include? ","
      puts "HEY! I said NO COMMAS! GRRRRAWR... Enter it again.:"
    elsif loan_amount.include? "-"
      puts "Careful! -- the symbol will alter the answer. Enter again:"
    elsif loan_amount.to_f <= 0 || loan_amount.empty?
      puts "Hey... I only work with nonzero, positive loans.:"
    else
      break
    end
  end

  puts "How long is your loan duration? (In years):"

  loan_duration = ''
  loop do
    loan_duration = gets.chomp
    if loan_duration.empty?() || loan_duration.to_i <= 0
      puts "Give me a valid loan duration."
    else
      break
    end
  end

  puts "What is your APR? (e.g. put '4.5' if you have 4.5% APR)"

  apr = ''
  loop do
    apr = gets.chomp
    if apr.empty? || apr.to_f <= 0
      puts "Wow, I don't believe you.  What is your APR?:"
    elsif apr.include? "%"
      puts "DUDE. Leave the percent sign out.:"
    else
      break
    end
  end

  loan_in_months = loan_duration.to_i * 12
  monthly_rate = ((apr.to_f / 100) / 12)
  monthly_payment = loan_amount.to_i *
                    (monthly_rate / (1 - (1 + monthly_rate)**-loan_in_months))

  puts "Your monthly payment is $#{monthly_payment.truncate(2)} per month"
  puts "Calculate another monthly payment? ('Y' to continue)"
  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
end

puts "Thanks for using my calculator! Enjoy paying your mortgage! Bwahaha..."
