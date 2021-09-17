def palindrome?(str)
    new_str = ""
    i = str.length - 1
    while i >= 0
        new_str << str[i]
        i -= 1
    end
    new_str == str
end


def substrings(str)
    arr = []
    old = str.split("")
    old.each_index do |i|
        old.each_index do |index|
            arr << old[i, index + 1].join("") if !arr.include?(old[i, index + 1].join(""))
        end
    end
    arr
end

def palindrome_substrings(str)
    substrings(str).select do |sub|
        palindrome?(sub) if sub.length > 1
    end
end

