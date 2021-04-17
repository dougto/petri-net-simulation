classdef tree
  properties
    RootNode
  end

  methods (Static)
    function printMarkings(node)
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

    function plot(node)
      [treeArray, labels, transitions] = getTreeArrayWithLabel(node);

      treeplot(treeArray)

      [x,y] = treelayout(treeArray);

      for i=1:length(x)
        text(x(i),y(i),labels(i),'FontSize',18)
        text(x(i),y(i)+0.2,transitions(i),'FontSize',18)
      end

      function [treearray, nodevals, transitions] = getTreeArrayWithLabel(parent_node)
        [nodes, ~, nodevals, transitions] = treebuilder(parent_node, 1);
        treearray = [0, nodes];

        function [out, node, nodevals, transitions] = treebuilder(parent_node, rnode)
          out = []; nodevals = {}; transitions = {};
          node = rnode;
          numberOfchildren = size(parent_node.Children)(2);

          if rnode == 1
            nodevals = [strcat('[',num2str(parent_node.Marking),']')];
            transitions(1) = '-';
          end

          for ii = 1:numberOfchildren
            node = node + 1;
            if !isempty(parent_node.Children{1,ii})
              [tb, node, nv, tr] = treebuilder(parent_node.Children{1,ii}, node);
              out = [out, rnode, tb];
              nodevals = [nodevals, strcat('[',num2str(parent_node.Children{1,ii}.Marking),']'), nv];
              transitions = [transitions, strcat('t',num2str(ii)), tr];
            end
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