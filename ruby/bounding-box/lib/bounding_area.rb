class BoundingArea
  attr_accessor :bounding_boxes
  def initialize(bounding_boxes)
    @bounding_boxes = bounding_boxes
  end
  def boxes_contain_point?(x, y)
    outcome = nil
    bounding_boxes.each do |box|
      if box.contains_point?(x,y)
        outcome = true
      end
    end
    if outcome != true
      outcome = false
    end
    outcome
  end
end
