require 'byebug'
class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if node.nil?
      @parent = nil
    else
      if @parent
        old_parent = self.parent
        old_parent.children.delete(self)
      end
      @parent = node
      node.children << self unless node.children.include?(self)
    end
  end

  def inspect
    "#{@value}, #{@parent}, #{@children}"
  end
end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")
#
# n3.parent = n1
# n3.parent = n2
