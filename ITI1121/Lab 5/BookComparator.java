import java.util.Comparator;

public class BookComparator implements Comparator<Book> {

    public int compare(Book a,Book b){
        int authorCompare = a.getAuthor().compareTo(b.getAuthor());
        int titleCompare = a.getTitle().compareTo(b.getTitle());
        int yearCompare = Integer.compare(a.getYear(),b.getYear());
        if(authorCompare == 0){
            if(titleCompare == 0){
                if(yearCompare == 0){
                    return yearCompare;
                }
                else{
                    return yearCompare;
                }
            }
            else{
                return titleCompare;
            }
        }
        else{
            return authorCompare;
        }
    }

    public boolean equals(Book a,Book b){
        return a.getAuthor().equalsIgnoreCase(b.getAuthor())&&a.getTitle().equalsIgnoreCase(b.getTitle())&&a.getYear()==b.getYear();
    }
}