function PETRI()
  # matrix number of columns is equal the number of places
  # matrix number of rows is equal the number of transitions
  transitions_input = [1 0 0 0 0;0 1 1 0 1;0 0 1 0 0;0 0 0 1 0];
  transitions_output = [0 1 1 0 1;0 0 0 0 1;0 0 0 1 0;0 1 1 0 0];
  marking = [0 2 1 0 1];
  
  # validate input
  
  # print possible markings
  transitions_number = size(transitions_input)(1);
  places_number = size(transitions_input)(2);
  transition_is_enabled = 0;
  
  # for i = 1:10
    for j = 1:transitions_number
      transition_is_enabled = 1;
      
      for k = 1:places_number
        if marking(k) < transitions_input(j,k)
          transition_is_enabled = 0;
        endif
      endfor
      
      if transition_is_enabled == 1
        disp("transition enabled: "), disp(j)
        
        new_marking = zeros(1, places_number);
        
        for k = 1:places_number
          new_marking(k) = marking(k) - transitions_input(j,k);
          new_marking(k) = new_marking(k) + transitions_output(j,k);
        endfor
        
        disp("new marking: "), disp(new_marking)
      endif
    endfor
  # endfor
endfunction