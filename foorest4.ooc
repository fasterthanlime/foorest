import structs/ArrayList

// let's try an even deeper hierarchy
// But now our testing code will become somehow convoluted if we
// keep doing it the Java-way. Let's do ourselves a favor and try
// to make our tree API better.

Node: class {
    
    // we can add data to every node, too
    data: Object
    
    // now we have a list of children
    children := ArrayList<Node> new()
    
    // create an empty node
    init: func ~withData(=data) {}
    
    // create a node with content!
    // we take an array of objects so we can use array literals
    init: func ~withContent (=data, children: Object[]) {
        // add everything as a node here
        for(i in 0..children length) {
            child := children[i]
            if(child instanceOf(Node)) {
                this children add(child)
            } else {
                this children add(Node new(child))
            }
        }
    }
    
    // add a child to this node.
    add: func (o: Object) {
        children add(o)
    }
    
    // let's walk this tree, depth-first!
    // f is a function that takes an object
    // aaand the depth at which we are in the tree
    walk: func (f: Func (Object, Int)) {
        _walk(f, 0)
    }
    
    // the real walk function, which is protected
    _walk: func (f: Func (Object, Int), depth: Int) {
        
        // callback on our data
        f(data, depth)
        
        // walk every child, too
        for(child in children) {
            child _walk(f, depth + 1)
        }
        
    }
    
}

// Here's our tree class, nothing fancy so far
Tree: class {
    
    // we'll initialize it later
    root : Node
    
    // a tree with a user-defined root node
    init: func ~withRoot (data: Object, children: Object[]) {
        root = Node new(data, children)
    }
    
}

// let's add a little convenience method to build MyStrings more easily
str: func (s: String) -> MyString { MyString new(s) }

MyString: class {
    content := ""
    
    init: func (=content) {}
}

c := [
       str("C++"),
       str("Objective-C")
     ]

data := [
          str("Python"),
          str("Ruby"),
          Node new(str("C"), c),
          str("ooc")
        ]

tree := Tree new(str("Languages"), data)

"Content of tree = " println()
tree root walk(|child, depth|
    ("  " * depth + "- ") print()
    "%s" format(child as MyString content) println()
)





