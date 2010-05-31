import structs/ArrayList

// what about getting generic now?

// Node is a generic class now.
// T is the type of the data it holds
Node: class <T> {
    
    // we can add data to every node, too
    data: T
    
    // now we have a list of children
    children : ArrayList<Node>
    
    // create an empty node
    init: func ~withData(=data) {
        this children = ArrayList<Node> new()
    }
    
    // create a node with content!
    // we take an array of objects so we can use array literals
    init: func ~withContent (=data, children: Node<T>[]) {
        // add everything as a node here
        this children = children as ArrayList<Node<T>>
    }
    
    // add a child to this node.
    add: func (o: Object) {
        children add(o)
    }
    
    // let's walk this tree, depth-first!
    // f is a function that takes an object
    // aaand the depth at which we are in the tree
    walk: func (f: Func (T, Int)) {
        _walk(f, 0)
    }
    
    // the real walk function, which is protected
    _walk: func (f: Func (T, Int), depth: Int) {
        
        // callback on our data
        f(data, depth)
        
        // walk every child, too
        for(child in children) {
            child as Node _walk(f, depth + 1)
        }
        
    }
    
}

// again, convenience methods:
node: func ~withData    <T> (data: T) -> Node<T> {
    Node<T> new(data)
}
node: func ~withContent <T> (data: T, children: Node<T>[]) -> Node<T> {
    Node<T> new(data, children)
}

// let's build a string tree now
{
    
    c := [
           node("C++"),
           node("Objective-C")
         ]

    data := [
              node("Python"),
              node("Ruby"),
              node("C", c),
              node("ooc")
            ]
            
    root := node("Languages", data)

    // oh, also, I completely removed the Tree class. Who needs it now =)

    "String tree = " println()

    root walk(|child, depth|
        ("  " * depth + "- ") print()
        "%s" format(child) println()
    )
    
}


// let's build a tree of floats now, just to show off
{
    
    sub := [
              node(2.25),
              node(2.5),
              node(2.75)
           ]
           
    data := [
               node(1.0),
               node(2.0, sub),
               node(3.0)
            ]
               
    root := node(0.0, data)
    
    "\nFloat tree = " println()

    root walk(|child, depth|
        ("  " * depth + "- ") print()
        "%.2f" format(child) println()
    )

}




