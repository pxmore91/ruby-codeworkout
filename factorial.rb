class Factorial
  def factorial(n)
    if n<2
      return 1
    end
    return n* factorial(n-1)
    # noo
  end
end