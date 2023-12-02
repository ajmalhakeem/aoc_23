def read_file file_name
    file_data = File.open(file_name).readlines.map(&:chomp)
end


def convert_line line
    word_number_lookup = {
        "one" => "1",
        "two" => "2",
        "three" => "3",
        "four" => "4",
        "five" => "5",
        "six" => "6",
        "seven" => "7",
        "eight" => "8",
        "nine" => "9",
        "zero" => "0"
    }

    formatted_line = line
    
    word_number_lookup.each do |word, number| 
        if line.include? word
            formatted_line = formatted_line.sub word, number
        end
    end
    return formatted_line
end

read_file("samplep2.txt").each do |line| 
    puts convert_line(line)
end
