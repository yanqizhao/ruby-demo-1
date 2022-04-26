a = 3
x = 'big' if a > 6
p x

a = 3
if a > 3
    then p 'big'
else
    p 'small'
end

a = 3
p 'small' if a < 6
p 'small' unless a > 6
p 'small' if not a > 6

a = 3
case a
when 1, 3, 5
    p 'odd'
when 2, 4, 6
    p 'even'
end

3.times do p 'eat'
end

3.times {p 'run'}

3.times do |i| p "#{i} eat"
end

3.times {|i| p "#{i} run"}

names = ['alice', 'amy', 'lily']
names.each do |name| p name
end

for i in 1..5
    p i
end

i = 1
while i < 3
    p i
    i += 1
end

i = 1
until i >= 3
    p i
    i += 1
end

person = {name: 'Amy', age: 18}
p person[:name]
person[:say] = lambda {p 'hi'}
p person[:say]