def first_anagram?(src_str, tar_str)
  tar_arr = tar_str.split("")
  src_str.split("").permutation.to_a.include?(tar_arr)
end

def second_anagram?(src_str, tar_str)
  i, j = 0, 0
  while i < src_str.size
    while j < tar_str.size
      if src_str[i] == tar_str[j]
        src_str[i] = ""
        tar_str[j] = ""
        i -= 1
        j -= 1
        break
      end
      j += 1
    end
    j = 0
    i += 1
  end

  src_str == "" && tar_str == ""
end

def third_anagram?(src, tar)
  src.split("").sort == tar.split("").sort
end

def fourth_anagram?(src, tar)
  s_hash = Hash.new(0)
  t_hash = Hash.new(0)
  src.each_char { |l| s_hash[l] += 1 }
  tar.each_char { |l| t_hash[l] += 1 }

  s_hash == t_hash
end
