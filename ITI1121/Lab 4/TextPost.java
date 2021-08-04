public class TextPost extends Post {

    private String message;

    public TextPost(String userName, String message) {
        super(userName);
        this.message = message;
    }

    public String getMessage() {
        return this.message;
    }

    public String toString() {
        String str;
        str = super.toString() + ", " + this.message;
        return  str;
    }

    public boolean isPopular() {
        return super.getLikes()>50;
    }

}
