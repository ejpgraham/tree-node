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
    if @parent
      old_parent = self.parent
      old_parent.children.delete(self)
    end

    if node.nil?
      @parent = nil
    else
      @parent = node
      node.children << self unless node.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "not a child" if child_node.parent.nil?
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    # debugger
    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end

    nil
  end

  def inspect
    "#{@value}"
  end
end

a = PolyTreeNode.new("A")
b = PolyTreeNode.new("B")
c = PolyTreeNode.new("C")
d = PolyTreeNode.new("D")
e = PolyTreeNode.new("E")

b.parent = a
c.parent = a
d.parent = b
e.parent = b
p a.dfs("E")
