def chop item, collection
  index_offset = 0
  item_index = -1
  first_element_index = 0
  until collection.empty?
    last_element_index = (collection.length - 1)
    middle_element_index =  last_element_index / 2
    middle_element = collection[middle_element_index]
    if middle_element == item
      item_index = index_offset + middle_element_index
      break
    elsif middle_element < item
      next_search_range = middle_element_index.succ..last_element_index
      index_offset = index_offset + next_search_range.first
    else
      next_search_range = first_element_index...middle_element_index
    end
    collection = collection[next_search_range]
  end
  item_index
end
