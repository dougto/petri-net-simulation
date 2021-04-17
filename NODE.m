classdef node < handle
  properties
    Marking
    Children = {}
  end

  methods
    function n = node(marking)
      n.Marking = marking;
    end
  end

end
