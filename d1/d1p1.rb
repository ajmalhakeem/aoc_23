def read_file file_name
  file_data = File.open(file_name).readlines.map(&:chomp)
end

def extract_numbers line
    numbers = line.delete("^0-9")
    first_num = numbers[0]
    last_num = numbers[-1]

    return first_num + last_num
end

total = 0

read_file("d1.txt").each do |line|
   total += extract_numbers(line).to_i
end

puts total

