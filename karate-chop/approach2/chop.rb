class SortedCollection
  
  def initialize sorted_collection
    @collection = sorted_collection
  end

  def last_index
    @collection.length - 1
  end

  def mid_index
    last_index / 2
  end

  def mid_item
    @collection[mid_index]
  end

  def slice range
    SortedCollection.new @collection[range]
  end

  def chop item
    _chop(item, self) || -1
  end

  def empty?
    @collection.empty?
  end

  def next_search_range item
    if item > mid_item
      mid_index.succ..last_index
    elsif item < mid_item
      0...mid_index
    end
  end
  
  private

  def _chop item, sorted_collection
    index_offset = 0
    until sorted_collection.empty?
      if (next_search_range = sorted_collection.next_search_range(item))
        sorted_collection = sorted_collection.slice next_search_range
        index_offset += next_search_range.first
      else
        return index_offset + sorted_collection.mid_index
      end
    end
  end
  
end

def chop item, collection
  sorted_collection = SortedCollection.new collection
  sorted_collection.chop item
end
