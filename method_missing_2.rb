class MyClass
  def method_missing(method, *args)
    p "method: #{method}, args: #{args}"
    p '找不到对应的方法呀大哥'
  end
end

obj = MyClass.new
obj.xxx

# method_missing 可以让一个对象响应任何方法！
# 请看 mash.rb