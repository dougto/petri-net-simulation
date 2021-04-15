classdef tree
  properties
    RootNode
  end

  methods (Static)
    function plot(node)
      printMarking(node);

      function printMarking(node)
        disp(node.Marking)

        numberOfchildren = size(node.Children)(2);

        for i = 1:numberOfchildren
          if !isempty(node.Children{1,i})
            printMarking(node.Children{1,i});
          endif
        end
      end
    end
  end
end