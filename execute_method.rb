# 上面代码略
  def my_method
    temp = @x + 1
    my_other_method(temp)
  end
# 下面代码略
# 请问 @x 要去哪里找？my_other_method 要去哪里找？
# 凭直觉来说，应该去接收者（对象）身上找，即 t.my_method 中的 t

# Ruby 每一行代码都会在一个对象 t 中执行
# 这个对象我们称之为「当前对象」，使用 self 关键字可以获取当前对象
# 任何时候，只有一个对象能充当当前对象，一段时间后，换另一个对象充当当前对象
# 调用一个方法时，接收者就是当前对象了。也就是 self。

class MyClass
  def testing_self
    @var = 10
    my_method
    self
  end

  def my_method
    @var += 1
  end
end

obj1 = MyClass.new
p obj1.testing_self

# 这次调用中 @var 是 obj1 的 @var，my_method 是 obj1 的 my_method，self 就是 obj1
obj2 = MyClass.new
p obj2.testing_self
# 这次调用中 @var 是 obj2 的 @var，my_method 是 obj2 的 my_method，self 就是 obj2

# 打印
# #<MyClass:0x00007fb071880d50 @var=11>
# #<MyClass:0x00007fb071880bc0 @var=11>

############################
# 顶级作用域中的 self 是谁？ #
############################
obj = {name: 'frank'}
p obj
p self # main
# main 是什么？
# Ruby 开始执行程序时，会创建一个对象，这个对象自定义了 to_s 和 inspect 方法，所以打印出来一个 main
class Temp
  def to_s
    'ccceeetemp'
  end
  def inspect
    'cccdddtemp'
  end
end
p Temp.new
########################
# 类定义中的 self 是谁？ #
########################

class MyClass
  p 'my_method out'
  p self # self 是类
  def my_method
    p 'my_method in'
    p self # self 是接收者（对象）
  end
end

mc = MyClass.new
mc.my_method

p MyClass.new

# 打印
# {:name=>"frank"}
# main
# \u65B9\u65B9\u7684temp
# "my_method out"
# MyClass
# "my_method in"
# #<MyClass:0x00007fe46d85fdc8>
# #<MyClass:0x00007fe46d85fc60>

# 接下来看 private.rb