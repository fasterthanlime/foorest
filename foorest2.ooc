// But a tree isn't a tree without children right? Let's store them with lists.
import structs/ArrayList

Node: class {
    
    // now we have a list of children
    children := ArrayList<Object> new()
    
    // add a child to this node.
    add: func (o: Object) {
        children add(o)
    }
    
}

// Here's our tree class, nothing fancy so far
Tree: class {
    
    // the root node. Still empty
    root := Node new()
    
}


// testing code:
tree := Tree new()
// strings aren't really object yet, but we can cheat here =)
tree root add("Ohai!" as Object)
tree root add("Hey there" as Object)

"Content of tree = " println()
for(child in tree root children) {
    "- %s" format(child as String) println()
}
