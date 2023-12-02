def read_file file_name
    file_data = File.open(file_name).readlines.map(&:chomp)
end

def convert_to_num hash,map
    if hash.keys.first.match?(/\A\d+\z/)
        hash.keys.first
    else 
        map[hash.keys.first]
    end
end

def convert_words words
    word_number_map = {
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
   
    sum = 0
    words.map do |word|
        words_found = []
        digits_found = []
        word_number_map.each do |key, value|
            if word.include? key
                words_found.append({key => word.rindex(key)})
            end
            if word.include? value
                digits_found.append({value => word.rindex(value)})
            end
        end
        
        combined_found = words_found + digits_found
        first_number = combined_found.min_by { |h| h.values.first }
        last_number = combined_found.max_by {|h| h.values.first}
        
        combined_num = convert_to_num(first_number, word_number_map) + convert_to_num(last_number, word_number_map) 
   
        sum += combined_num.to_i

        sum
    end

    sum

end

puts convert_words(read_file("input.txt"))
