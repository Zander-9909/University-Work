/* *
 * Use static array for NewsFeed
 * with constant MAX_SIZE
 * */

import javafx.geometry.Pos;

public class NewsFeed {

    private Post[] messages;
    private int size;
    public static final int MAX_SIZE = 25;

    public NewsFeed() {
        this.messages = new Post[MAX_SIZE];
        this.size = 0;
    }

    public void add(Post message) {
        if(this.size != MAX_SIZE-1) {
            this.messages[this.size] = message;
            this.size++;
        }
    }

    public Post get(int index) {
        return this.messages[index];
    }

    public int size() {
        return this.size;
    }

    public void sort(){
        int i, j, argMin;
        Post tmp;
        for (i = 0; i < size - 1; i++) {
            argMin = i;
            for (j = i + 1; j < size(); j++) {
                if (this.messages[j].compareTo(this.messages[argMin]) < 0) {
                    argMin = j;
                }
            }

            tmp = this.messages[argMin];
            this.messages[argMin] = this.messages[i];
            this.messages[i] = tmp;
        }
        for (int k = 0; k < this.messages.length; k++) {
            System.out.println(this.messages[k]);
        }

    }

    public NewsFeed getPhotoPost(){
        NewsFeed photos = new NewsFeed();
        for (int i = 0; i < this.size; i++) {
            if(this.messages[i] instanceof PhotoPost){
                photos.add(this.messages[i]);
            }
        }
        return photos;
    }

    public NewsFeed plus(NewsFeed other) {
        NewsFeed brandNewFeed = new NewsFeed();
        for (int i = 0; i < this.size; i++) {
            brandNewFeed.add(this.messages[i]);
        }
        for (int i = 0; i < other.size; i++) {
            brandNewFeed.add(other.messages[i]);
        }
        brandNewFeed.sort();
        return brandNewFeed;
    }
}
