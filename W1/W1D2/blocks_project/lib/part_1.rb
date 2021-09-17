def select_even_nums(arr)
    arr.select { |ele| ele % 2 == 0 }
end

def reject_puppies(dogs)
    dogs.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays(arrs)
    arrs.count {|arr| arr.sum > 0 }
end

def aba_translate(str)
    translation = ""
    str.each_char do |char|
        if "aeiou".include?(char)
            translation << char + "b" + char
        else
            translation << char
        end
    end
    translation
end

p aba_translate("cats")

def aba_array(array)
    array.map {|str| aba_translate(str)}
end
