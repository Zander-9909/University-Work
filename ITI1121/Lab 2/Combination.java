public class Combination {
    //Instance Variables
    public int first,second,third;
    public Combination(int first,int second,int third){
        if((first<=5&&first>=1)&&(second<=5&&second>=1)&&(third<=5&&third>=1)) {
            this.first = first;
            this.second = second;
            this.third = third;
        }
    }
    public boolean equals(Combination other){
            return this.first==other.first&&this.second == other.second&&this.third == other.third;
    }
    public String toString(){
        String toReturn;
        toReturn = Integer.toString(this.first)+":"+Integer.toString(this.second)+":"+Integer.toString(this.third);
        return toReturn;
    }
}