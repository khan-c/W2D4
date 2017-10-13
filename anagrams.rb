# O(n*n!)
def first_anagrams(arg, arg2)
  words= arg.chars.permutation.to_a
  words.map!(&:join)
  words.include?(arg2)
end
# p first_anagrams("rearrnge", "megrernr")

# O(n)
def second_anagram?(str1, str2)
  letters1 = str1.chars
  letters2 = str2.chars

  until letters2.empty? || letters1.empty?
    if letters1.include?(letters2.first)
      letter_idx2 = letters1.index(letters2.first)
      letters1.delete_at(letter_idx2)
      letters2.shift
    else
      return false
    end
  end

  letters2.empty? && letters1.empty?
end
# p second_anagram?("blvis", "livbs")
# p second_anagram?("blvis", "livbe")

# O(n)
def third_anagram?(str1, str2)
  str1.chars.sort.join("") == str2.chars.sort.join("")
end
# p third_anagram?("blvis", "livbe")
# p third_anagram?("blvis", "livbs")

# O(n)
def fourth_anagram?(str1, str2)
  str1_counts = Hash.new(0)
  # str2_counts = Hash.new(0)

  str1.chars.each do |char|
    str1_counts[char] += 1
  end

  str2.chars.each do |char|
    str1_counts[char] -= 1
  end

  str1_counts.values.all? { |count| count == 0 }
end
p third_anagram?("blvis", "livbe")
p third_anagram?("blvis", "livbs")
