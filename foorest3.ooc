import structs/ArrayList

// now, what we had here is mostly a list, what about getting deeper?

Node: class {
    
    // now we have a list of children
    children := ArrayList<Object> new()
    
    // add a child to this node.
    add: func (o: Object) {
        children add(o)
    }
    
    // let's walk this tree, depth-first!
    // f is a function that takes an object
    walk: func (f: Func (Object)) {
        
        printf("Walking a node with %d nodes\n", children size())
        
        // for every child
        for(child in children) {
            printf("Child is a %s\n", child class name)
            
            if (child instanceOf(Node)) {
                // if it's a node, we have more children
                child as Node walk(f)
            } else {
                // if it's not, well, it's content and we call f
                f(child)
            }
        }
        
    }
    
}

// Here's our tree class, nothing fancy so far
Tree: class {
    
    // the root node. Still empty
    root := Node new()
    
}

// since we're comparing classes above, we can't cheat anymore now
// Strings are only arrays of chars so far so they don't have a class,
// we have to build one ourselves (as I said - so far!)
MyString: class {
    content := ""
    
    init: func (=content) {}
}


// testing code:
tree := Tree new()
// strings aren't really object yet, but we can cheat here =)
tree root add(MyString new("Ohai!"))
tree root add(MyString new("Hey there"))

"Content of tree = " println()
tree root walk(|child|
    "- %s" format(child as MyString content) println()
)
