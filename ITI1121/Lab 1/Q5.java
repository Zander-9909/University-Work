public class Q5 {
    public static void main(String[] args){
        boolean[] test = new boolean[8];

        //test for isPrime
        test[0]  = (isPrime(31) == true);
        test[1] = (isPrime(4) == false);
        test[2] = (isPrime(7) == true);
        test[3] = (isPrime(15) == false);

        test[4]  = (getFibonacci(10) == 55);
        test[5]  = (getFibonacci(3) == 2);
        test[6]  = (getFibonacci(5) == 5);
        test[7]  = (getFibonacci(8) == 21);


        boolean testFlag=true;
        for (int i = 0; i < test.length; i++){
            if(test[i]){
                System.out.println("test " + i + " passed");
            } else {
                System.out.println("test " + i + " failed");
                testFlag = false;
            }
        }

        if(testFlag ){
            System.out.println("All tests are successful");
        } else {
            System.out.println("Not all tests are successful");
        }

    }

    //method that determines if the number x is prime
    public static boolean isPrime(int x){
        boolean prime = true;
        if(x < 2){
            prime = false;
        }
        int i = 2;
        while(prime && x > i){
            if(x % i == 0){
                prime = false;
            }
            i++;
        }
        return prime;
    }

    //returns the fibonacci number at the position in parameter
    public static int getFibonacci(int position) {

        int num = 0;
        int num2 = 1;
        int fibonacci = 0;

        if (position == 0) {//Position 0 (Special Case)
            return fibonacci;
        }
        else if (position == 1) {//Position 1 (Special Case)
            fibonacci = 1;
            return fibonacci;
        }
        else {//any other value
            for (int i = 1; i<position;i++ ) {
                fibonacci = num2+num;
                num = num2;
                num2 = fibonacci;
            }
        }
        System.out.println(fibonacci);
        return fibonacci;
    }
}
