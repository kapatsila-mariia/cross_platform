module Rectangle
  # Add draw_rectangle() and draw_simple_line() to Window which simplifies
  # drawing simple rectangles and lines in one colour
  class Window
    # Simplify drawing a rectangle in a single colour.
    #
    # * +point+     [Point] Top left corner
    # * +size+      [Size] Width and Height
    # * +z_index+   [Fixnum] Z-order
    # * +colour+    [Gosu::Color] Colour of rectangle

    def draw_rectangle(point, size, z_index, colour)
      left    = point.x
      top     = point.y
      width   = size.width
      height  = size.height

      draw_quad(
        left, top, colour,
        left + width, top, colour,
        left + width, top + height, colour,
        left, top + height, colour,
        z_index)
    end

    # Simplify drawing a line.
    #
    # There are dire warnings in the Gosu documentation for draw_line() which
    # suggest that line drawing should only be done for debugging purposes.
    #
    # * +p1+        [Point] Beginning point
    # * +p2+        [Point] Endpoint
    # * +z_index+   [Fixnum] Z-order
    # * +colour+    [Gosu::Color] Colour of line

    def draw_simple_line(p1, p2, z_index, colour)
      draw_line(p1.x, p1.y, colour, p2.x, p2.y, colour, z_index)
    end
  end

  # Add a measure to return both width and height for a text and a way to
  # centre a piece of text in a rectangle.
  class Font
    include GosuEnhanced

    # Return the width and height of a given string
    #
    # * +text+    String to measure
    #
    # return::    [Size] The height and width of the string.

    def measure(text)
      Size.new(text_width(text, 1), height)
    end

    # Return the co-ordnates needed to place a given string in the centre of an
    # area, both vertically and horizontally.
    #
    # * +text+    [String] String to centre
    # * +rect+    [Size] Rectangular area size
    #
    # return::  [Point] The point to write the string, expressed as an offset
    #           from the top-left corner of the rectangle.

    def centred_in(text, rect)
      size = measure(text)

      Point((rect.width - size.width) / 2, (rect.height - size.height) / 2)
    end

    # Synonym for centred_in, allowing for centre to be spelled center.
    #
    # * +text+    [String] String to centre
    # * +rect+    [Size] Rectangular area size

    alias centered_in centred_in
  end
end