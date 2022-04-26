class MyClass
  def initialize
    @v = 1
  end

  def my_method
    @v += 1
    # 自动 return @v
  end
end

obj = MyClass.new
p obj.class
p obj.my_method
p obj.instance_variables
# obj[:@v] # 方法太多了，不打印了
p obj.methods.grep(/my/) # 在 methods 中搜索含有 my 的
p MyClass.instance_methods.grep(/my/) # 其实 MyClass.instance_methods 就是 obj.methods


# # 打印
# MyClass
# 2
# [:@v]
# [:my_method]
# [:my_method]


# # 不过这里我挺纳闷为什么 MyClass.instance_variables 却是空的，@v 居然在 obj.instance_variables
# # OC 也是这样的，因为每个实例的属性都是不同的，所以存储在实例对象里，而不是类里
# #
# # 总结：
# # 一个对象的实例变量储存在自身
# # 一个对象的方法存储在其类身上
# #
# # 请看 1.png
# #
# # 接下来看 class_is_an_object.rb