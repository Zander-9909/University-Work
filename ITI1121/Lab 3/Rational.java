public class Rational {

    private int numerator = 1;
    private int denominator = 1;

    // constructors

    public Rational(int numerator) {
        this.numerator = numerator;
    }

    public Rational(int numerator, int denominator) {
        this.numerator = numerator;
        this.denominator = denominator;
    }

    // getters

    public int getNumerator() {
        return this.numerator;
    }

    public int getDenominator() {
        return this.denominator;
    }

    // instance methods

    public Rational plus(Rational other) {
        int numerator,denominator;
        numerator = this.numerator*other.denominator+this.denominator*other.numerator;
        denominator = this.denominator*other.denominator;
        return new Rational(numerator,denominator);
    }

    public static Rational plus(Rational a, Rational b) {
        int numerator,denominator;
        numerator = a.numerator*b.denominator+a.denominator*b.numerator;
        denominator = a.denominator*b.denominator;
        Rational result = new Rational(numerator,denominator);
        result.reduce();
        return result;
    }

    // Transforms this number into its reduced form

    private void reduce() {
        int gcd = gcd(this.numerator,this.denominator);
        this.numerator /= gcd;
        this.denominator /= gcd;
    }

    // Euclid's algorithm for calculating the greatest common divisor
    private int gcd(int a, int b) {
        // Note that the loop below, as-is, will time out on negative inputs.
        // The gcd should always be a positive number.
        // Add code here to pre-process the inputs so this doesn't happen.
        if(a<0)a *= -1;
        if(b<0)b *= -1;
        while (a != b)
            if (a > b)
                a = a - b;
            else
                b = b - a;
        return a;
    }

    public int compareTo(Rational other) {
        int commonDenominator = this.denominator*other.denominator;
        Rational thisNew = new Rational(this.numerator*other.denominator,commonDenominator);
        Rational otherNew = new Rational(other.numerator*this.denominator,commonDenominator);
        if(thisNew.numerator == otherNew.numerator)return 0;
        else if(thisNew.numerator > otherNew.numerator)return 1;
        else return -1;
    }

    public boolean equals(Rational other) {
        int commonDenominator = this.denominator*other.denominator;
        Rational thisNew = new Rational(this.numerator*other.denominator,commonDenominator);
        Rational otherNew = new Rational(other.numerator*this.denominator,commonDenominator);
        return thisNew.numerator == otherNew.numerator;
    }

    public String toString() {
        String result;
        if (this.denominator == 1) {
            result = Integer.toString(this.numerator);
        } else {
            result = Integer.toString(this.numerator);
            result+= "/"+Integer.toString(this.denominator);
        }
        return result;
    }

}