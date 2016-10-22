require 'objspace'
require 'pp'

print "OBJECT SIZE: "

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
counts.delete_if {|_,v| v == 0}

print "COUNTS: "
pp counts

print "MATH: "
pp (counts.values.inject(0, :+) * 40)
