# dogs and cats
class Queue
  def initialize
    @q = []
  end

  def enqueue(v)
    @q.push(v)
  end

  def dequeue
    @q.shift
  end
end

class AnimalShelter
  def initialize
    @main = Queue.new
    @tmp_cat = Queue.new
    @tmp_dog = Queue.new
  end

  def enqueue(v)
    @main.enqueue(v)
  end

  def dequeue_any
    @main.dequeue
  end

  def dequeue_dog
    animal = @tmp_dog.dequeue || dequeue_any

    return nil unless animal

    return animal if animal == 'dog'

    @tmp_cat.enqueue(animal)

    dequeue_dog
  end

  def dequeue_cat
    animal = @tmp_cat.dequeue || dequeue_any

    return nil unless animal

    return animal if animal == 'cat'

    @tmp_dog.enqueue(animal)

    dequeue_cat
  end
end

a = AnimalShelter.new
a.enqueue('dog')
a.enqueue('cat')
a.enqueue('dog')
a.enqueue('cat')
a.enqueue('dog')

# i want a cat
# go through 3 dogs to get to the cat
# what do I do with those 3 dogs?
# can I put them back in the queue?, not really because they'd no longer be at the end
# what 

rs = []

rs.push a.dequeue_cat # cat
rs.push a.dequeue_dog # dog
rs.push a.dequeue_dog # dog
rs.push a.dequeue_any # cat
rs.push a.dequeue_cat # nil

# [cat, dog, dog, cat, nil]
puts rs.to_s
