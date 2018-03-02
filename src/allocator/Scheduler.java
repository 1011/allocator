// Chris Iverson
// Compilers 198:415
// Prof. Uli Kremer
// Spring 2018

package allocator;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Scheduler {

	public Scheduler() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		/* command line arguments here will be
		 * args[0] :== the number, k, of registers available
		 * args[1] :== flag for allocator mode
		 * 		b :== bottom down allocator
		 * 		//s :== simple top down (live range is entire basic block)
		 * 		//t :== top down (live range and MAX_LIVE)
		 * 		//o :== own implementation
		 * args[2] :== name of input file
		 */
		
		int k = Integer.parseInt(args[0]);
		char flag = args[1].charAt(0);
		
		BufferedReader reader = null;

		try {
		    File file = new File(args[2]);
		    reader = new BufferedReader(new FileReader(file));

		    String line;
		    while ((line = reader.readLine()).trim() != null) {
		    		if(line.startsWith("//")||line.isEmpty()) {
		    			System.out.println("Trimmed Comments and Whitespace");
				}else {
					Inode tmp = new Inode(line);

			    		//node has values use some shit
			    }
			    
			    //System.out.println(line);     
		    }
 
		} catch (IOException e) {
			System.out.println("Error in Command Line Syntax, suggest checking file name");
		    e.printStackTrace();
		}

	}

}
