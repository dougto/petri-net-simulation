function PETRI(transitions_input, transitions_output, marking)
  root_node = node(marking, 0, 1);

  calculateMarkings(transitions_input, transitions_output, marking, root_node, root_node)

  % tree.printMarkings(root_node)
  tree.plot(root_node)
end

function calculateMarkings(transitions_input, transitions_output, marking, current_node, petri_tree)
  transitions_number = size(transitions_input)(1);
  places_number = size(transitions_input)(2);

  for jj = 1:transitions_number
    transition_is_enabled = 1;

    for k = 1:places_number
      temp = transition_is_enabled;

      if marking(k) < transitions_input(jj,k)
        transition_is_enabled = 0;
      end

      if marking(k) == -1
        transition_is_enabled = temp;
      end
    end

    if transition_is_enabled
      new_marking = getNewMarking(current_node, marking, transitions_input, transitions_output, jj);

      node_exists = tree.nodeExists(petri_tree, new_marking);

      new_node = node(new_marking, current_node, 0);

      current_node.Children(jj) = new_node;

      if !node_exists
        calculateMarkings(transitions_input, transitions_output, new_marking, new_node, petri_tree);
      end
    end
  end
end

function new_marking = getNewMarking(current_node, marking, transitions_input, transitions_output, transition)
  places_number = size(transitions_input)(2);

  new_marking = zeros(1, places_number);

  for jj = 1:places_number
    if marking(jj) == -1
      new_marking(jj) = -1;
    else
      new_marking(jj) = marking(jj) - transitions_input(transition,jj) + transitions_output(transition,jj);
    end
  end

  marking_path = tree.getMarkingsPath(current_node);

  number_of_parent_markings = size(marking_path)(2);

  for ii = 1:number_of_parent_markings
    if new_marking >= marking_path{1,ii} && any(new_marking > marking_path{1,ii})
      for kk = 1:places_number
        if new_marking(kk) > marking_path{1,ii}(kk)
          new_marking(kk) = -1;
        end
      end
    end
  end
end
