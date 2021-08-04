import java.util.Calendar;
import java.util.Date;

public class Post implements Likeable, Comparable<Post> {

    protected int likes;
    private Date timeStamp;
    private String userName;

    public Post(String userName) {
        this.userName = userName;
        this.timeStamp = Calendar.getInstance().getTime();
        this.likes = 0;
    }

    public String getUserName() {
        return this.userName;
    }

    public Date getTimeStamp() {
        return this.timeStamp;
    }

    // Implement the methods required by the interface Likeable.
    // This file will not compile unless they are present with the correct name and signature.

    public String toString() {
        String str;
        str = getClass().getName() + ": " + this.timeStamp.toString() + ", " + this.userName + ", likes = " + this.likes;
        return  str;
    }

    public void like(){
        this.likes++;
    }

    public int getLikes(){
        return this.likes;
    }


    public int compareTo(Post other){
        return this.getTimeStamp().compareTo(other.getTimeStamp());
    }

    public boolean isPopular(){
        return this.likes>100;
    }

}
