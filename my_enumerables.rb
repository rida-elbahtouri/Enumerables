module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times do |item|
      yield(self[item])
    end
  end

  def my_each_with_index
    return to_enum(:my_each) unless block_given?

    size.times do |item|
      yield(self[item], item)
    end
  end

  def my_select
    return to_enum(:my_each) unless block_given?

    size.times do |_item|
      new_ar = []
      my_each do |item|
        new_ar << item if yield(item)
      end
      return new_ar
    end
  end

  def my_all?
    return to_enum(:my_each) unless block_given?

    result = true
    size.times do |item|
      result = yield(self[item])
      return result if result == false
    end
    result
  end

  def my_any?
    return to_enum(:my_each) unless block_given?

    result = false
    size.times do |item|
      result = yield(self[item])
      return result if result == true
    end
    result
  end

  def my_none?
    return to_enum(:my_each) unless block_given?

    result = true
    size.times do |item|
      result = yield(self[item])
      return false if result == true
    end
    true
  end

  def my_count(items = 0)
    total = 0
    size.times do |item|
      case items
      when 0
        return size
      when self[item]
        total += 1
      end
    end
    total
  end
end
