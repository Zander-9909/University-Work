/**
 * This class allows allows for a user to access and use the "findAndReplace method",
 * allowing a user to take an input string array and replace elements with matching ones;
 *<p>;
 * @author Griffin Taylor;
 */
public class Utils {
    /**
     * Returns a copy of the array 'in' where each word occurring in the array
     * 'what' has been replaced by the word occurring in the same position
     * in the array 'with'.
     *
     * @param in an array of Strings;
     * @param what an array of words to be replaced;
     * @param with an array of replacement words;
     * @return a new array identical to 'in' except that all the occurrences of words
     * found in 'what' have been replaced by the corresponding word from 'with'.
     */

    public static String[] findAndReplace( String[] in, String[] what, String[] with ) {

        String[] out = null; // The new array to be returned
        boolean valid = true; // True if the pre-conditions are satistified

        // Testing pre-conditions

        if ( in == null || what == null || with == null ) {
            valid = false;
        } else {
            if(what.length==with.length){
                for (int i = 0; i < 3; i++) {
                    if(i == 0){
                        for (int j = 0; j < in.length; j++) {//checking in values to see if they are null
                            if(in[j]==null)valid = false;
                        }
                    }
                    else if(i==1){
                        for (int j = 0; j < what.length; j++) {//checking what values to see if they are null
                            if(what[j]==null)valid = false;
                        }
                    }
                    else{
                        for (int j = 0; j < with.length; j++) {//checking with values to see if they are null
                            if(with[j]==null)valid = false;
                        }
                    }
                }
            }
            else valid = false;
        }

        if ( valid ) {
            out = new String[ in.length ];
            for ( int i=0; i<in.length; i++ ) {
                out[i] = in[i];
                for (int j = 0; j < what.length; j++) {
                    if(out[i].equals(what[j]))out[i]=with[j];
                }
                //more or less 10 lines missing
            }
        }
        // Returning a reference to the newly created array that
        // contains the same entries as 'in' except that all the
        // occurrences of words from 'what' have been replaced by
        // their corresponding occurrence from 'with'.

        return out;
    }
}
