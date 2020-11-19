# frozen_string_literal: true

class Dummy
  def store(file)
    File.open(file).map(&:split)
  end

  def get_pages(data)
    data.map { |el| el[0] }.uniq
  end

  def find_ips(data, value)
    data.select { |el| el[0] == value }
  end

  def create_an_array_of_ips(ips)
    ips.each_with_object([]) { |value, array| array << value[1] }
  end
end
