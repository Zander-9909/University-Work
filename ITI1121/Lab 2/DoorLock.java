public class DoorLock {
    private static final int MAX_NUMBER_OF_ATTEMPTS = 3;
    private Combination doorCombo;
    private boolean doorOpen = false,doorActivated = true;
    private int numAttempts = 0;
    public DoorLock(Combination combo){
        this.doorCombo = new Combination(combo.first,combo.second,combo.third);
    }
    public boolean isOpen(){
        return this.doorOpen;
    }
    public boolean isActivated(){
        return this.doorActivated;
    }
    public void activate(Combination c){
            this.doorActivated = this.doorCombo.equals(c)&&numAttempts!=MAX_NUMBER_OF_ATTEMPTS;
    }
    public boolean open(Combination combination){
        if(numAttempts != MAX_NUMBER_OF_ATTEMPTS){
            if (doorActivated && this.doorCombo.equals(combination)) {
                return true;
            } else {
                numAttempts++;
                return false;
            }
        }
        else {
            doorActivated = false;
            return false;
        }
    }
}