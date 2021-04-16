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
          end
        end
      end
    end

    function r = nodeExists(parent_node, marking)
      r = internalNodeExists(parent_node, marking);

      function r = internalNodeExists(parent_node, intMarking)
        if parent_node.Marking == intMarking
          r = 1;
          return
        end

        numberOfchildren = size(parent_node.Children)(2);

        for i = 1:numberOfchildren
          if !isempty(parent_node.Children{1,i})
            r = internalNodeExists(parent_node.Children{1,i}, intMarking);
            if r == 1
              return
            end
          end
        end

        r = 0;
      end
    end
  end
end