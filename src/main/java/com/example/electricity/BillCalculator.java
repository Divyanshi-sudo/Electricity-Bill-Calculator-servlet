package com.example.electricity;

public class BillCalculator {
    public static double calculateBill(double units) {
        if (units <= 0) {
            return 0.0;
        }

        double bill = 0.0;

        if (units <= 50) {
            bill += units * 3.5;
            return roundToTwoDecimalPlaces(bill);
        }

        bill += 50 * 3.5;
        units -= 50;

        if (units <= 100) {
            bill += units * 4.0;
            return roundToTwoDecimalPlaces(bill);
        }

        bill += 100 * 4.0;
        units -= 100;

        if (units <= 100) {
            bill += units * 5.2;
            return roundToTwoDecimalPlaces(bill);
        }

        bill += 100 * 5.2;
        units -= 100;
        bill += units * 6.5;

        return roundToTwoDecimalPlaces(bill);
    }

    private static double roundToTwoDecimalPlaces(double value) {
        return Math.round(value * 100.0) / 100.0;
    }
}
