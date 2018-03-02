package allocator;

public class Inode implements Comparable<Inode>{
	
	//represents the raw text line of the instruction
	String sentence;
	
	//represents the ILOC command this instruction is issuing
	String cmd;
	
	//register, or value, located after the command and before the comma
	String op1;
	
	//register, or value, located after the comma and before the => sign
	String op2;
	
	//register, located after the => sign
	String op3;

	public Inode(String line) {
	
		line = line.trim().replaceAll(" +", "");
	    String[] comps = line.split("\t");
	    this.sentence = line;
	    
	    int i = 0;
	    for(String comp:comps) {
	    		switch(i) {
		    		case 1:
		    			this.cmd = comp;
		    			break;
		    			
		    		case 2:
		    			if(comp.contains(",")) {
		    				int place = comp.indexOf(",");
		    				this.op1 = comp.substring(0, place);
		    				this.op2 = comp.substring(place+1);
		    			}else {
		    				this.op1 = comp;
		    				this.op2 = null;
		    			}
		    			break;
		    			
		    		case 3:
		    			this.op3 = comp.substring(2);
		    		default:
		    			break;
	    		}
	    		//System.out.print(comp+"-----");
	    		i++;
	    }
	    //System.out.println();
		
	}

	@Override
	public int compareTo(Inode arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

}
