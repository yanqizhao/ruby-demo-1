module M2
  def my_method
    'M2#my_method()'
  end
end

class C2
  prepend M2 # 相当于 C1 < M1，但是不能继承一个模块，只能继承一个类
end

class D2 < C2

end

p D2.ancestors

d2 = D2.new
p d2.my_method

# 打印
# [D2, M2, C2, Object, Kernel, BasicObject]
# "M2#my_method()"

# 知道了如何查找方法，接下来看看如何执行方法 execute_method.rb
