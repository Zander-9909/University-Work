public class PhotoPost extends Post {

    private String fileName;
    private String caption;

    public PhotoPost(String userName, String fileName, String caption) {
        super(userName);
        this.fileName = fileName;
        this.caption = fileName;
    }

    public String getCaption() {
        return this.caption;
    }

    public String getFileName() {
        return this.fileName;
    }

    public String toString() {
        String str;
        str = super.toString() + ", " + this.fileName + ", " + this.caption;
        return str;
    }

}
