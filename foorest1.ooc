
Node: class {
    
    // let's say we want to store strings, at first.
    data := ""
    
}

// Here's our tree class, nothing fancy so far
Tree: class {
    
    // the root node. Empty, at first, using the default constructor
    root := Node new()
    
}


// testing code:
tree := Tree new()
tree root data = "Root"
"Content of first node = '%s'. Yay!" format(tree root data) println()
