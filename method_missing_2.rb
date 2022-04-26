class MyClass
  def method_missing(method, *args)
    p "method: #{method}, args: #{args}"
    p 'method not found!'
  end
end

obj = MyClass.new
obj.xxx(1,2,3)

# 打印
# "method: xxx, args: [1, 2, 3]"
# "method not found!"

# method_missing 可以让一个对象响应任何方法！
# 请看 mash.rb