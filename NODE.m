function n = NODE(marking, parent)
  # the NODE function returns one node of a petri tree
  # every node has the following properties:
  #
  # Marking
  # Parent
  # Children

  n.Marking = marking;
  n.Parent = parent;
  n.Children = {};

endfunction
