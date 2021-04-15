classdef node < handle
  properties
    Marking
    Parent = 0
    Children = {}
  end

  methods
    function n = node(marking)
      n.Marking = marking;
    end
  end

end
