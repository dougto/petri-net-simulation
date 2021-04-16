function PETRI()
  % matrix number of columns is equal the number of places
  % matrix number of rows is equal the number of transitions
  transitions_input = [1 0 0;1 0 0];
  transitions_output = [0 1 0;0 0 1];
  marking = [2 0 0];
  initial_height = 0;
  max_height = 10;

  root_node = node(marking);

  calculateMarkings(transitions_input, transitions_output, marking, initial_height, max_height, root_node, root_node)

  tree.plot(root_node);
end

function calculateMarkings(transitions_input, transitions_output, marking, height, max_height, current_node, petri_tree)
  transitions_number = size(transitions_input)(1);
  places_number = size(transitions_input)(2);

  height = height + 1;

  for j = 1:transitions_number
    transition_is_enabled = 1;

    for k = 1:places_number
      if marking(k) < transitions_input(j,k)
        transition_is_enabled = 0;
      end
    end

    if transition_is_enabled == 1
      new_marking = zeros(1, places_number);

      new_marking = marking - transitions_input(j,:) + transitions_output(j,:);

      if tree.nodeExists(petri_tree, new_marking) == 0
        new_node = node(new_marking);

        current_node.Children(j) = new_node;

        if height == max_height
          disp("reached maximum search height")
          return
        end

        calculateMarkings(transitions_input, transitions_output, new_marking, height, max_height, new_node, petri_tree);
      end
    end
  end
end
