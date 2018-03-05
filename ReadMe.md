#Local Register Allocator
#####Chris Iverson
#####Spring 2018

###Generating Executable

You can generate the necessary class files for running the allocator by typing `make all`. This will execute the commands:
```
javac -cp Rnode.java Inode.java
javac alloc.java
```

###Running Allocator

Once the .class files have been created, you can run the allocator using the following syntax:
```
./alloc k f filename

// int k => number of registers on target machine
// char f => flag for allocator mode (s, t)
// String filename => path to target instruction file from current directory
```

###Description of Implementation

My implementation uses three files *alloc.java*, *Inode.java*, and *Rnode.java* in order to implement:
-Simple Top Down Allocator
-Top Down [Live Range] Allocator

The *alloc.java* file contains the main method which must be run to operate the allocator. The methods used to implement the different allocator modes are also included here.
The *Inode.java* file contains the structure of a custom class for an Instruction node, which is usesd in the code to maintain information about the instructions after parsing the input file.
The *Rnode.java* file contains the structure of a custom class for a Register node, which tracks which virtual registers are used in the input file and holds information necessary for the mode of allocation, such as live range or occurance count. 
