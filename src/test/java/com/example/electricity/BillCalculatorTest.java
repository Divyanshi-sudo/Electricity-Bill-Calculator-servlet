package com.example.electricity;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class BillCalculatorTest {

    @Test
    void shouldCalculateBillForFirst50Units() {
        assertEquals(175.0, BillCalculator.calculateBill(50), 0.01);
    }

    @Test
    void shouldCalculateBillFor150Units() {
        assertEquals(575.0, BillCalculator.calculateBill(150), 0.01);
    }

    @Test
    void shouldCalculateBillFor300Units() {
        assertEquals(1420.0, BillCalculator.calculateBill(300), 0.01);
    }

    @Test
    void shouldReturnZeroForZeroUnits() {
        assertEquals(0.0, BillCalculator.calculateBill(0), 0.01);
    }
}
