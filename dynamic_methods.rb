# 调用方法有两种写法
# obj.my_method('hi')
# obj.send(:my_method, 'hi')
# 后者的好处是可以实现动态派发，另一个好处是可以调用私有方法

class Notification
  def notify(which)
    send "notify_#{which}", "hi"
  end

  private

  def notify_wechat(msg)
    p "通知到微信#{msg}"
  end
  def notify_email(msg)
    p "通知到邮件#{msg}"
  end
  def notify_phone(msg)
    p "通知到手机#{msg}"
  end
  def notify_dingding(msg)
    p "通知到dingding#{msg}"
  end
  def notify_all(msg)
    notify_wechat(msg)
    notify_email(msg)
    notify_phone(msg)
    notify_dingding(msg)
  end
end

n = Notification.new
n.notify('all')

# 打印
# "\u901A\u77E5\u5230\u5FAE\u4FE1hi"
# "\u901A\u77E5\u5230\u90AE\u4EF6hi"
# "\u901A\u77E5\u5230\u624B\u673Ahi"
# "\u901A\u77E5\u5230dingdinghi"

# 除了动态调用方法
# 还可以动态定义方法
# 见 define_methods_dynamically.rb