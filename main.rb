
path = "./files/level2/level2_5.in"
path_out = "./files/level2/level2_5.out"

def read_file(path)
   file = File.open(path)
   file_data = file.readlines.map(&:chomp)
   file.close
   file_data
end

def find_min(data)
  relevant_data = data.drop(1)
  relevant_data.map(&:to_i).each_with_index.min[1]
end

def write_to_file(content, file)
  file = File.open(file, 'w')
  content.each do |line|
    file.write(line + "\n")
  end
  file.close
end

data = read_file(path)
p data
num_of_prices = data.first.to_i
prices = data.drop(1).take(num_of_prices)
p prices

tasks_plus_num = data.drop(1 + num_of_prices)
task_num = tasks_plus_num.first
tasks = tasks_plus_num.drop(1)
p tasks



def work(prices, minutes_length)
  # what I need to do is find the
  # start of the interval of length n whose sum is minimal
  #
  # 1. create all intervals of length n
  # 2. select the one with the minimum sum

  endpoint = prices.length - minutes_length
  min_slice_start = -1
  min_slice_sum = 999999999999999999999999999999
  (0..endpoint).map do |i|
    slice = prices.slice(i, minutes_length).map(&:to_i)
    sum = slice.sum
    if sum < min_slice_sum
      min_slice_start = i
      min_slice_sum = sum
    end
  end
  min_slice_start
end


result = tasks.map do |task_string|
  task = task_string.split.map(&:to_i)
  p task[0]
  index = work(prices, task[1])
  "#{task[0]} #{index}"
end
result.insert(0, task_num)

# min = find_min(data)
# p min
write_to_file(result, path_out)
# p file_contents.rindex(min)
