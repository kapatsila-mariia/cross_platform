module L1_rectangle
  # Hold a (x, y) pixel position, and allow for offsetting and movement
  Point = Struct.new(:x, :y) do
    # Negative co-ordinates are allowed.

    # Return a new point offset by +by_x+ and +by_y+
    # by_x and by_y can be Fixnum, or another Point, or a Size
    def offset(by_x, by_y = nil)
      dup.move_by!(by_x, by_y)
    end

    # Move the current point offset by +by_x+ and +by_y+
    # by_x and by_y can be Fixnum, or another Point, or a Size
    def move_by!(by_x, by_y = nil)
      return move_by_point(by_x) if by_x.respond_to? :x
      return move_by_size(by_x)  if by_x.respond_to? :width

      self.x += by_x
      self.y += by_y

      self
    end

    # Move the current point to the point +new_x+ and +new_y+
    # by_x and by_y can be Fixnum or another Point
    def move_to!(new_x, new_y = nil)
      return move_to_point(new_x) if new_x.respond_to? :x

      self.x = new_x
      self.y = new_y

      self
    end

    private

    # Move the current point by the x and y co-ordinates in the Point +pt+
    def move_by_point(pt)
      self.x += pt.x
      self.y += pt.y

      self
    end

    # Move the current point by the width and height in the Size +sz+
    def move_by_size(sz)
      self.x += sz.width
      self.y += sz.height

      self
    end

    # Move the current point to the x and y co-ordinates in the point +pt+
    def move_to_point(pt)
      self.x = pt.x
      self.y = pt.y

      self
    end
  end

  def Point(x, y)
    Point.new(x, y)
  end

  module_function :Point
end