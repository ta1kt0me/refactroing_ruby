class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title, :price_code

  def price_code=(value)
    @price_code = value
    @price = case price_code
      when REGULAR: RegularPrice.new
      when NEW_RELEASE: NewReleasePrice.new
      when CHILDRENS: ChildrensPrice.new
    end
  end

  def initialize(title, the_price_code)
    @title, self.price_code = title, the_price_code
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end

module Price
  def frequent_renter_points(days_rented)
    1
  end
end

class RegularPrice
  include Price

  def charge(days_rented)
    result += 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    result
  end
end

class NewReleasePrice
  def charge(days_rented)
    days_rented * 3
  end

  def frequent_renter_points(days_rented)
    days_rented > 1 ? 2 : 1
  end
end

class ChildrensPrice
  include Price

  def charge(days_rented)
    result += 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end
end

class RegularPrice
  def charge(days_rented)
    result += 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    result
  end
end

class NewReleasePrice
  def charge(days_rented)
    days_rented * 3
  end

end

class ChildrensPrice
  def charge(days_rented)
    result += 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end
