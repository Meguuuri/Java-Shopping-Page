package utils;

/** Small input-validation helpers. */
public final class Validator {

    private Validator() { }

    public static boolean isEmpty(String s) {
        return s == null || s.trim().length() == 0;
    }

    public static boolean isPositiveInt(String s) {
        if (s == null) {
            return false;
        }
        try {
            return Integer.parseInt(s.trim()) > 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}