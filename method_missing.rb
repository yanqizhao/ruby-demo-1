# 由于 Ruby 不会静态检查代码，所以下面代码不会报错，等你运行的时候才会报错

class MyClass; end

obj = MyClass.new
obj.xxx
# undefined method `xxx' for #<MyClass...

# 打印
# method_missing.rb:6:in `<main>': undefined method `xxx' for #<MyClass:0x00007f9f1b079420> (NoMethodError)

# 因为 MyClass 及其祖先链上都没有 xxx 方法
# 最后 Ruby 只好调用 BaseObject#method_missing 方法

obj.send(:method_missing, :xxx)
# undefined method `xxx' for #<MyClass...

# 打印
# method_missing.rb:15:in `<main>': undefined method `xxx' for #<MyClass:0x00007faade04f390> (NoMethodError)

# 神奇的地方在于，我们可以在 MyClass 里覆盖 method_missing 方法
# 见 method_missing_2.rb
