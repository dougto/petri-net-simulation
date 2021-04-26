classdef node < handle
  properties
    Parent
    Root
    Marking
    Children = {}
  end

  methods
    function n = node(marking, parent, root)
      n.Marking = marking;
      n.Parent = parent;
      n.Root = root;
    end
  end

end
