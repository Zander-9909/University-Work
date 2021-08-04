public class Book {

    private String author;
    private String title;
    private int year;

    public Book (String author, String title, int year) {
        this.author = author;
        this.title = title;
        this.year = year;
    }

    public String getAuthor() {
        return this.author;
    }

    public String getTitle() {
        return this.title;
    }

    public int getYear() {
        return this.year;
    }

    public boolean equals(Object other) {
        if(this == other) return true;
        if(other == null)return false;
        if(getClass()!=other.getClass()) return false;
        Book otherBook = (Book) other;
        return this.title.equalsIgnoreCase(otherBook.title)&&this.author.equalsIgnoreCase(otherBook.author)&&this.year == otherBook.year;
    }

    public String toString() {
        return author+": "+title+"("+year+")";
    }
}