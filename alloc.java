// Chris Iverson
// Compilers 198:415
// Prof. Uli Kremer
// Spring 2018

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

public class alloc {
	
	static int k;
	static char flag;
	static ArrayList<Inode> instructions;
	static ArrayList<Rnode> registers;
	static HashMap<String, String> reg_map;
	static ArrayList<Inode> final_instructions;

	public static void main(String[] args) {
		/* command line arguments here will be
		 * args[0] :== the number, k, of registers available
		 * args[1] :== flag for allocator mode
		 * 		//b :== bottom down allocator
		 * 		s :== simple top down (live range is entire basic block)
		 * 		t :== top down (live range and MAX_LIVE)
		 * 		//o :== own implementation
		 * args[2] :== name of input file
		 */
		long startTime = System.nanoTime();
		try {
			 k = Integer.parseInt(args[0]);
			 flag = args[1].charAt(0);
		}catch(Exception e){
			System.out.println("//Unexpected Command Line Input, expecting format 'path:user$ alloc k f file.i'");
			return;
		}
		
		instructions = new ArrayList<Inode>();
		registers = new ArrayList<Rnode>();
		reg_map = new HashMap<String,String>();
		final_instructions = new ArrayList<Inode>();
		
		parseInput(args[2]);
		
		System.out.println("// Chris Iverson\n// Compilers 198:415\n// Spring 2018");
		
		switch(flag) {
		
			case 's':
				System.out.println("//Using the Simple Top Down allocator with "+k+" registers on");
				for(Inode node:instructions){
					System.out.println("//\t"+node.toString());
				}
				s_allocate();
				break;
				
			case 't':
				System.out.println("//Using the Top Down [live range] allocator with "+k+" registers");
				//print done internally, peep t_alloc()
				t_allocate();
				break;
				
			default:
				System.out.println("//INVALID FLAG: try 's',  or 't'");
			
		}

		long endTime   = System.nanoTime();
		long totalTime = (endTime - startTime);
		double milliseconds = totalTime / 1000.0;
		System.out.println("//Allocation runtime: " + milliseconds + " milliseconds");
		
		//Output resultant instructions
		System.out.println("//___________________________");
		for(Inode node:final_instructions){
			System.out.println(node.toString());
		}

	}
	
	public static void parseInput(String filename) {
		BufferedReader reader = null;
		try {
		    File file = new File(filename);
		    reader = new BufferedReader(new FileReader(file));

		    String line;
		    while ((line = reader.readLine()) != null) {
		    	line = line.trim();
		    	if(line.startsWith("//")||line.isEmpty()) {
		    			//System.out.println("Trimmed Comments and Whitespace");
				}else {
					//System.out.println(line);
					Inode tmp = new Inode(line);
					instructions.add(tmp);
					//System.out.println(tmp.info());
					//System.out.println(tmp.toString());
			    }
			    //System.out.println(line);     
		    }
 
		} catch (IOException e) {
			System.out.println("Error in Command Line Syntax, suggest checking file name");
		    e.printStackTrace();
		}
	}
	
	public static void s_allocate() {
		
		boolean r1_live = false;
		boolean r2_live = false;
		
		//first parse instructions to create/count occurrences of Registers in code
		for(Inode node:instructions){
			//System.out.println("// "+node.info());
			checkOp(node.op1.trim());
			checkOp(node.op2.trim());
			checkOp(node.op3.trim());
		}
		//then, sort into priority order
		Collections.sort(registers);
		
		//third, assign available physical registers in priority order
		int i = 3;
		int j = 0;
		System.out.println("\n//Mapping of virtual registers to physical registers/memory:");
		for(Rnode node:registers) {
			if(i <= k) {
				String phys = "r"+ i;
				node.phys_reg = phys;
			}else {
				j -= 4;
				String mem = String.valueOf(j);
				node.phys_reg = mem;
			}
			i++;
			System.out.println("\t//"+node.s_info());	
			reg_map.put(node.virt_reg, node.phys_reg);
		}
		
		//lastly, rewrite the instruction sequence
		for(Inode node:instructions){
			// System.out.println(node.toString());
			// System.out.println(node.info());
			Inode store = null;
			if(node.cmd.equals("store")){
				//check the left operand
				//if its mapped to a virtual register, just replace op1 in instruction node
				//else add a load instruction => r1 and set op1 => r1
				String replace = reg_map.get(node.op1);
				//System.out.println("Replace: " + replace);
				if(replace.substring(0,1).equals("r")) {
					//this virtual register is high priority and is mapped to a phys register
					//no additional instruction needed, just change the op register val
					node.op1 = replace;
				}else {
					//this register needs to be loaded from memory BEFORE this instr
					String tmp_instr = "loadAI\tr0, " + replace + "\t=> r1";
					node.op1 = "r1";
					Inode tmp = new Inode(tmp_instr);
					final_instructions.add(tmp);
				}

				//check the right operand
				//if its mapped to a virtual register, just replace op3 in instruction node
				//else add a load instruction => r2 and set op3 => r2
				replace = reg_map.get(node.op3);
				//System.out.println("Replace: " + replace);
				if(replace.substring(0,1).equals("r")) {
					//this virtual register is high priority and is mapped to a phys register
					//no additional instruction needed, just change the op register val
					node.op3 = replace;
				}else {
					//this register needs to be loaded from memory BEFORE this instr
					String tmp_instr = "loadAI\tr0, " + replace + "\t=> r2";
					node.op3 = "r2";
					Inode tmp = new Inode(tmp_instr);
					final_instructions.add(tmp);
				}
			}else{
			
				if(node.op1.substring(0,1).equals("r") && !node.op1.substring(1).equals("0")) {
					String replace = reg_map.get(node.op1);
					//System.out.println("Replace: " + replace);
					if(replace.substring(0,1).equals("r")) {
						//this virtual register is high priority and is mapped to a phys register
						//no additional instruction needed, just change the op register val
						node.op1 = replace;
					}else {
						//this register needs to be loaded from memory BEFORE this instr
						//look to see which reg in feasible set is available
						String tmp_instr = "";
						if(!r1_live) {
							tmp_instr = "loadAI\tr0, " + replace + "\t=> r1";
							node.op1 = "r1";
							r1_live = true;
						}else if(!r2_live) {
							tmp_instr = "loadAI\tr0, " + replace + "\t=> r2";
							node.op1 = "r2";
							r2_live = true;
						}else {
							System.out.println("No feasible register is available for this assignment \n"
									+ "something needs to be fixed!!");
							break;
						}
						Inode tmp = new Inode(tmp_instr);
						final_instructions.add(tmp);
					}
				}
				
				if(!node.op2.isEmpty()) {
					if(node.op2.substring(0,1).equals("r") && !node.op2.substring(1).equals("0")) {
						String replace = reg_map.get(node.op2);
						//System.out.println("Replace: " + replace);
						if(replace.substring(0,1).equals("r")) {
							//this virtual register is high priority and is mapped to a phys register
							//no additional instruction needed, just change the op register val
							node.op2 = replace;
						}else {
							//this register needs to be loaded from memory BEFORE this instr
							//look to see which reg in feasible set is available
							String tmp_instr = "";
							if(!r1_live) {
								tmp_instr = "loadAI\tr0, " + replace + "\t=> r1";
								node.op2 = "r1";
								r1_live = true;
							}else if(!r2_live) {
								tmp_instr = "loadAI\tr0, " + replace + "\t=> r2";
								node.op2 = "r2";
								r2_live = true;
							}else {
								System.out.println("//No feasible register is available for this assignment \n"
										+ "something needs to be fixed!!");
								break;
							}
							Inode tmp = new Inode(tmp_instr);
							final_instructions.add(tmp);
						}
					}
				}
				
				if(!node.op3.isEmpty()) {
					if(node.op3.substring(0,1).equals("r") && !node.op3.substring(1).equals("0")) {
						String replace = reg_map.get(node.op3);
						//System.out.println("Replace: " + replace);
						if(replace.substring(0,1).equals("r")) {
							//this virtual register is high priority and is mapped to a phys register
							//no additional instruction needed, just change the op register val
							node.op3 = replace;
						}else {
							//this register will need to be stored in memory immediately after assign
							String store_instr = "storeAI\tr1\t=> r0, " + replace;
							node.op3 = "r1";
							//r1_live = true;
							store = new Inode(store_instr);
						}
					}
				}
				// //System.out.println(node.info()+"   ----------->");
				// node.updateSentence();
				// //System.out.println(node.toString());
				// final_instructions.add(node);
				// if(store != null) {
				// 	final_instructions.add(store);
				// 	r1_live = r2_live = false;
				// }
			}
			node.updateSentence();
			final_instructions.add(node);
			if(store != null) {
				final_instructions.add(store);
				r1_live = r2_live = false;
			}
		}
	}
	
	public static void t_allocate() {
		
		boolean r1_live = false;
		boolean r2_live = false;
		int max_live = k-2;
		
		//first parse instructions to create/count occurrences of Registers and track LIVE Range in code
		int index = 0;
		for(Inode node:instructions){
			//System.out.println(node.info());
			checkLive(node.op1,index);
			checkLive(node.op2,index);
			checkLive(node.op3,index);
			index++;
		}
		
		for(Rnode reg:registers) {
			for(int i = reg.first_use;i<reg.last_use;i++) {
				Inode ins = instructions.get(i);
				ins.liveset.add(reg.virt_reg);
				ins.liveCount++;
			}
		}
		
		int j = 0;
		int[] bitflags = new int[k+1];
		bitflags[0] = 1; //index 0 is r0 register, val of 1 indicates in-use
		for(Inode ins:instructions) {
			//dedicate 1st available
			System.out.println("//\t"+ins.toString()+"\t|Liveset:"+ins.liveset.toString());
			
			//for op1 and op2, if last use of a register, set bitflag to 0
			if(ins.op1.substring(0,1).equals("r") && !ins.op1.substring(1).equals("0")) {
				for(Rnode reg:registers) {
					if(reg.virt_reg.equals(ins.op1) && reg.last_use==instructions.indexOf(ins)) {
						//this is the last time this virtual reg is used,
						String tmp = reg_map.get(ins.op1);
						if(tmp.substring(0,1).equals("r")) {
							int phys = Integer.parseInt(tmp.substring(1));
							bitflags[phys] = 0; //freed up this reg because previous val wasnt live
						}
					}
				}
			}
			if(!ins.op2.isEmpty()) {	
				if(ins.op2.substring(0,1).equals("r") && !ins.op2.substring(1).equals("0")) {
					for(Rnode reg:registers) {
						if(reg.virt_reg.equals(ins.op2) && reg.last_use==instructions.indexOf(ins)) {
							//this is the last time this virtual reg is used,
							String tmp = reg_map.get(ins.op2);
							//System.out.print(" =>"+tmp);
							if(tmp.substring(0,1).equals("r")) {
								int phys = Integer.parseInt(tmp.substring(1));
								bitflags[phys] = 0; //freed up this reg because previous val wasnt live
							}
						}
					}
				}	
			}
		
			if(!ins.op3.isEmpty()) {
				if(ins.op3.substring(0,1).equals("r") && !ins.op3.substring(1).equals("0")) {
					if(ins.liveCount <= k-2) {
						if(reg_map.get(ins.op3) == null) {
							//this register is not mapped
							for(int a = 3; a <=k; a++) {
								if(bitflags[a] == 0) {
									reg_map.put(ins.op3, "r"+a);
									System.out.println(" mapped "+ins.op3+" => r"+a);
									//System.out.println("r"+a);
									for(Rnode reg:registers) {
										if(reg.virt_reg.equals(ins.op3)) {
											reg.phys_reg = "r"+a;
											break;
										}
									}
									bitflags[a] = 1;
									break;
								}
							}
						}
					}else {
						//need to spill, decide which reg to spill 
						int lowest_value = Integer.MAX_VALUE;
						Rnode target = null;
						for(String op: ins.liveset) {
							for(Rnode reg:registers) {
								if(reg.virt_reg.equals(op)) {
									//found an rnode
									if(reg.frequency < lowest_value) {
										//found less frequent options, swap target and min
										lowest_value = reg.frequency;
										target = reg;
									}else if(reg.frequency==lowest_value) {
										//same freq, check live range to break tie
										if(reg.duration()>target.duration()) {
											lowest_value = reg.frequency;
											target = reg;
										}
									}
								}
							}
						}
						j -= 4;
						target.phys_reg = String.valueOf(j);
						reg_map.put(ins.op3, reg_map.get(target.virt_reg));
						//System.out.println(" mapped "+ins.op3+" => "+reg_map.get(target.virt_reg));
						
						reg_map.put(target.virt_reg, target.phys_reg);
						//System.out.println(" mapped "+target.virt_reg+" => "+target.phys_reg);
					}
				}
			}
		}
		
		System.out.println("\n//Mapping of virtual registers to physical registers/memory:");
		for(Rnode node:registers) {
			
			System.out.println("\t//"+node.s_info());	
			reg_map.put(node.virt_reg, node.phys_reg);
		}
		
		//lastly, rewrite the instruction sequence
		for(Inode node:instructions){
			//System.out.println(node.toString());
			//System.out.println(node.info());
			
			if(node.op1.substring(0,1).equals("r") && !node.op1.substring(1).equals("0")) {
				String replace = reg_map.get(node.op1);
				//System.out.println("Replace: " + replace);
				if(replace.substring(0,1).equals("r")) {
					//this virtual register is high priority and is mapped to a phys register
					//no additional instruction needed, just change the op register val
					node.op1 = replace;
				}else {
					//this register needs to be loaded from memory BEFORE this instr
					//look to see which reg in feasible set is available
					String tmp_instr = "";
					if(!r1_live) {
						tmp_instr = "loadAI\t r0," + replace + "\t=> r1";
						node.op1 = "r1";
						r1_live = true;
					}else if(!r2_live) {
						tmp_instr = "loadAI\t r0," + replace + "\t=> r2";
						node.op1 = "r2";
						r2_live = true;
					}else {
						System.out.println("No feasible register is available for this assignment \n"
								+ "something needs to be fixed!!");
						break;
					}
					Inode tmp = new Inode(tmp_instr);
					final_instructions.add(tmp);
				}
			}
			
			if(!node.op2.isEmpty()) {
				if(node.op2.substring(0,1).equals("r") && !node.op2.substring(1).equals("0")) {
					String replace = reg_map.get(node.op2);
					//System.out.println("Replace: " + replace);
					if(replace.substring(0,1).equals("r")) {
						//this virtual register is high priority and is mapped to a phys register
						//no additional instruction needed, just change the op register val
						node.op2 = replace;
					}else {
						//this register needs to be loaded from memory BEFORE this instr
						//look to see which reg in feasible set is available
						String tmp_instr = "";
						if(!r1_live) {
							tmp_instr = "loadAI\t r0," + replace + "\t=> r1";
							node.op2 = "r1";
							r1_live = true;
						}else if(!r2_live) {
							tmp_instr = "loadAI\t r0," + replace + "\t=> r2";
							node.op2 = "r2";
							r2_live = true;
						}else {
							System.out.println("No feasible register is available for this assignment \n"
									+ "something needs to be fixed!!");
							break;
						}
						Inode tmp = new Inode(tmp_instr);
						final_instructions.add(tmp);
					}
				}
			}
			Inode store = null;
			if(!node.op3.isEmpty()) {
				if(node.op3.substring(0,1).equals("r") && !node.op3.substring(1).equals("0")) {
					String replace = reg_map.get(node.op3);
					//System.out.println("Replace: " + replace);
					if(replace.substring(0,1).equals("r")) {
						//this virtual register is high priority and is mapped to a phys register
						//no additional instruction needed, just change the op register val
						node.op3 = replace;
					}else {
						//this register will need to be stored in memory immediately after assign
						//assume its okay to overwrite whatever is in r1 by memory-memory model
						String store_instr = "storeAI\t r1\t => r0, " + replace;
						node.op3 = "r1";
						store = new Inode(store_instr);
					}
				}
			}
			//System.out.println(node.info()+"   ----------->");
			node.updateSentence();
			//System.out.println(node.toString());
			final_instructions.add(node);
			if(store != null) {
				final_instructions.add(store);
				r1_live = r2_live = false;
			}
		}
	}
	
	public static void checkOp(String op) {
		if(op != null){
			if(!op.isEmpty()) {
				if(op.substring(0,1).equals("r") && !op.substring(1).equals("0")) {
					boolean present = false;
					for(Rnode r_node:registers) {
						if(r_node.virt_reg.equals(op)) {
							r_node.frequency++;
							present = true;
							break;
						}
					}
					if(!present) {
						Rnode tmp = new Rnode(op);
						registers.add(tmp);
					}
				}
			}
		}	
	}
	
	public static void checkLive(String op, int index) {
		if(op != null){
			if(!op.isEmpty()) {
				if(op.substring(0,1).equals("r") && !op.substring(1).equals("0")) {
					boolean present = false;
					for(Rnode r_node:registers) {
						if(r_node.virt_reg.equals(op)) {
							r_node.frequency++;
							r_node.last_use=index;
							present = true;
							break;
						}
					}
					if(!present) {
						Rnode tmp = new Rnode(op);
						tmp.first_use=index;
						tmp.last_use=index;
						registers.add(tmp);
					}
				}
			}
		}
	}

}
