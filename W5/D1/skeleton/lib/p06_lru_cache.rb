require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
    @mro = nil
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      @mro = key
    else
      val = @prc.call(key)
      @store.append(key, val)
      @mro = key
      @map[key] = key
      if @map.store.size > @max
        @map.delete(@store.first.next)
      end
    end

  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
  end
end
