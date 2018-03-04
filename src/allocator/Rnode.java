package allocator;

public class Rnode implements Comparable<Rnode> {
	
	String virt_reg;
	int frequency;
	String phys_reg;
	int first_use;
	int last_use;
	

	public Rnode(String s) {
		this.virt_reg = s;
		this.frequency = 1;
		// TODO Auto-generated constructor stub
	}

	@Override
	public int compareTo(Rnode arg0) {
		if(this.frequency == arg0.frequency) {
			return 0;
		}else if(this.frequency < arg0.frequency) {
			return 1;
		}else {
			return -1;
		}
	}
	
	public String s_info() {
		String info = this.virt_reg + "\t Mapped to: " + this.phys_reg + "\t Freq= " + this.frequency;	
		return info;
	}
	
	public String t_info() {
		String info = this.virt_reg + "\t Freq= " + this.frequency 
				+"\t First use= " + this.first_use +"\t Last use= " + this.last_use;	
		return info;
	}
	
	public int duration() {
		return this.last_use-this.first_use;
	}

}
