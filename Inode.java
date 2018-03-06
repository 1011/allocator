// Chris Iverson
// Compilers 198:415
// Prof. Uli Kremer
// Spring 2018

import java.util.ArrayList;

public class Inode implements Comparable<Inode>{
	
	//represents the raw text line of the instruction
	private String sentence;
	
	//represents the ILOC command this instruction is issuing
	String cmd;
	
	//register, or value, located after the command and before the comma
	String op1;
	
	//register, or value, located after the comma and before the => sign
	String op2;
	
	//register, located after the => sign
	String op3;
	
	ArrayList<String> liveset;
	
	int liveCount;
	
	public Inode() {
		sentence = "";
		cmd = "";
	}

	public Inode(String line) {
		liveCount = 0;
		liveset = new ArrayList<String>(); 
		this.sentence = line;
		line = line.trim().replaceAll(" +", " \t");
	    String[] comps = line.split("\\t");
	    
	    int i = 1;
	    for(String comp:comps) {
	    	//System.out.println(i+":   "+comp);
	    		switch(i) {
		    		case 1:
		    			this.cmd = comp.trim();
		    			break;
		    			
		    		case 2:
		    			if(comp.contains(",")) {
		    				int place = comp.indexOf(",");
		    				this.op1 = comp.substring(0, place);
		    				this.op2 = comp.substring(place+1);
		    			}else {
		    				this.op1 = comp.trim();
		    				//this.op2 = "";
		    			}
		    			this.op2 = "";
		    			this.op3 = "";
		    			break;
		    			
		    		case 3:
		    			if(!comp.contains("=>")){
		    				this.op2 = comp.trim();
		    			}
		    			break;

		    		case 4:
		    			if(!comp.contains("=>")){
		    				this.op3 = comp.trim();
		    			}
		    			break;

		    		case 5:
		    			this.op3 = comp.trim();
		    		default:
		    			break;
	    		}
	    		//System.out.print(comp+"-----");
	    		i++;
	    }
	    //System.out.println();
		
	}
	
	public String info() {
		String info = "cmd: "+this.cmd+"\t op1: "+this.op1+"\t op2: "+this.op2+"\t op3: "+this.op3;
		return info;
	}
	
	public String toString() {
		return this.sentence;
	}
	
	public void updateSentence() {
		switch(this.cmd) {
		
		case "loadI":
		case "store":
		case "load":
			//System.out.println("case loadI");
			this.sentence = this.cmd+"\t"+this.op1+"\t=> "+this.op3;
			break;
			
		case "storeAI":
			//System.out.println("case storeAI");
			this.sentence = this.cmd + "\t" +this.op1 + "\t=> "+this.op2 +", " +this.op3;
			break;
			
		case "outputAI":
			//System.out.println("case outputAI");
			this.sentence = this.cmd + "\t" +this.op1+", "+this.op2;
			break;
		
		case "add":
		case "addI":
		case "mult":
		case "sub":
		case "lshift":
		case "rshift":
		case "subI":
			//System.out.println("case other thingies");
			this.sentence = this.cmd+"\t"+this.op1+", "+this.op2+"\t=> " + this.op3;
			break;
		
		default:
			break;
		
		}
	}

	@Override
	public int compareTo(Inode arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

}
