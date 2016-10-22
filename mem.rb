require 'objspace'
require 'pp'

puts "OBJECT SIZE"

size = ObjectSpace.memsize_of(Object::new)
pp size

def allocate_count
  GC.disable
  before = ObjectSpace.count_objects
  yield
  after = ObjectSpace.count_objects
  after.each { |k,v| after[k] = v - before[k] }
  GC.enable
  after
end

counts = allocate_count {
  /\A[[:space:]]*\z/ === "Привет";
}

counts.delete(:FREE)
counts.delete(:TOTAL)

puts "COUNTS"
pp counts

puts "MATH:"
pp (counts.values.inject(0, :+) * 40)
