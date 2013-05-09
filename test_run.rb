
PATH = File.expand_path File.dirname __FILE__

require "./utils/run"

puts "Test one:"
puts Utils::Run.run_python(File.join(PATH, "test_overtime.py"), nil, 1)

puts "Test two:"
puts Utils::Run.run_python(File.join(PATH, "test.py"), nil, 2)

puts "Test three:"
answers =  Utils::Run.run_python(File.join(PATH, "test_with_inputs.py"), File.join(PATH, "inputs"), 2)
if Utils::Run.verify_answer(answers.strip, File.open(File.join(PATH, "answer")).read.strip)
  puts "Yahooooo"
else
  puts "Oops"
end