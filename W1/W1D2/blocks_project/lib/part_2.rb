def all_words_capitalized?(arr)
    arr.all? {|word| word.capitalize == word}
end

def no_valid_url?(array)
    array.none? {|url| url.end_with?(".com", ".net", ".io", ".org")}
end

def any_passing_students?(array)
    array.any? do |student|
        avg = student[:grades].sum / student[:grades].length * 1.0
        avg >= 75
    end
end

students = [
        { name: "Alvin", grades: [70, 50, 75] },
        { name: "Warlin", grades: [80, 99, 95] },
        { name: "Vlad", grades: [100] },
      ]

any_passing_students?(students)
