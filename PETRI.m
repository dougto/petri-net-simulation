function PETRI()
  # matrix number of columns is equal the number of places
  # matrix number of rows is equal the number of transitions
  transitions_input = [1 0 0 0 0;0 1 1 0 1;0 0 1 0 0;0 0 0 1 0];
  transitions_output = [0 0 0 0 1;0 0 0 0 1;0 0 0 1 0;0 1 1 0 0];
  marking = [1 2 1 0 1];
  height = 0;
  max_height = 10;

  calculateMarkings(transitions_input, transitions_output, marking, height, max_height)
endfunction

function calculateMarkings(transitions_input, transitions_output, marking, height, max_height)
  # print possible markings
  transitions_number = size(transitions_input)(1);
  places_number = size(transitions_input)(2);
  transition_is_enabled = 0;

  height = height + 1;

  for j = 1:transitions_number
    transition_is_enabled = 1;

    for k = 1:places_number
      if marking(k) < transitions_input(j,k)
        transition_is_enabled = 0;
      endif
    endfor

    if transition_is_enabled == 1
      # disp("transition enabled: "), disp(j)

      new_marking = zeros(1, places_number);

      new_marking = marking - transitions_input(j,:) + transitions_output(j,:);

      disp("height: "), disp(height), disp("possible marking: "), disp(new_marking)

      if height == max_height
        disp("reached maximum search height")
        return
      endif

      calculateMarkings(transitions_input, transitions_output, new_marking, height, max_height);
    endif
  endfor
endfunction
